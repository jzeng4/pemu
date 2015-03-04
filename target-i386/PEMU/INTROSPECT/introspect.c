#include <stdio.h>
#include "qemu-common.h"

#include "qemu/host-utils.h"
#include "cpu.h"
#include "tcg-op.h"

#include "helper.h"
#define GEN_HELPER 1
#include "helper.h"

#include "../pemu.h"

#define DEBUG

static struct _INTROSPECT_INFO {
	target_ulong save_all[100];
	int syscall_num;
	int introspect_already_alloc;
	int return_pc;
	int syscall_retval;
} introspect_info;

static void introspect_save_all(CPUX86State *env)
{
	introspect_info.save_all[R_EAX] = env->regs[R_EAX];
	introspect_info.save_all[R_EBX] = env->regs[R_EBX];
	introspect_info.save_all[R_ECX] = env->regs[R_ECX];
	introspect_info.save_all[R_EDX] = env->regs[R_EDX];
	introspect_info.save_all[R_EDI] = env->regs[R_EDI];
	introspect_info.save_all[R_ESI] = env->regs[R_ESI];
	introspect_info.save_all[R_EBP] = env->regs[R_EBP];
	introspect_info.save_all[R_ESP] = env->regs[R_ESP];
}

static void introspect_restore_all(CPUX86State *env)
{
	env->regs[R_EAX] = introspect_info.save_all[R_EAX];
	env->regs[R_EBX] = introspect_info.save_all[R_EBX];
	env->regs[R_ECX] = introspect_info.save_all[R_ECX];
	env->regs[R_EDX] = introspect_info.save_all[R_EDX];
	env->regs[R_EDI] = introspect_info.save_all[R_EDI];
	env->regs[R_ESI] = introspect_info.save_all[R_ESI];
	env->regs[R_EBP] = introspect_info.save_all[R_EBP];
	env->regs[R_ESP] = introspect_info.save_all[R_ESP];
}

void introspect_sysenter(CPUX86State *env, int arg[], int num)
{
	if(introspect_info.syscall_num == 0x40) {
		//env->regs[R_ESI] = return_pc;
		//env->regs[R_ESI] = 0xb7ff91d4;
		assert(num <= 4);
		env->regs[R_EBX] = arg[0];
		env->regs[R_ECX] = arg[1];
		env->regs[R_EDX] = arg[2];
		env->regs[R_ESI] = arg[3];
		env->regs[R_EBP] = env->regs[R_ESP];
		env->regs[R_EAX] = 0x40;
		env->eip = 0xb7fe2419; //sysenter
#ifdef DEBUG
		fprintf(stdout, "introspect_sysenter finished\n");
#endif
	}
}

void introspect_sysexit(CPUX86State *env)
{	
	fprintf(stdout, "syscall 0x%x sysexit eax=%d\n", introspect_info.syscall_num, env->regs[R_EAX]);
	if(introspect_info.syscall_num == 0x40) {
		introspect_info.syscall_retval = env->regs[R_EAX]; 
		env->eip = introspect_info.return_pc;
		introspect_restore_all(env);
		introspect_info.syscall_num = 0;
		introspect_info.return_pc = 0;
		set_returnVal(introspect_info.syscall_retval);
		post_sem_2();
	}
}

#if 0
#define PROT_READ 0x1		/* page can be read */
#define PROT_WRITE 0x2		/* page can be written */

#define MAP_PRIVATE 0x02		/* Changes are private */
#define MAP_ANONYMOUS 0x20		/* don't use a file */

static void introspect_int80_mmap(CPUX86State *env)
{
	//mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7fe0000
	printf("introspect_int80_mmap\n");
	env->regs[R_EAX] = 0xc0;
	env->regs[R_EBX] = 0;
	env->regs[R_ECX] = 64 * 4096;
	env->regs[R_EDX] = PROT_READ|PROT_WRITE;
	env->regs[R_ESI] = MAP_PRIVATE|MAP_ANONYMOUS;
	env->regs[R_EDI] = -1;
	env->regs[R_EBP] = 0;

	env->eip = 0xb7ff9151; //int80
}
#endif

#if 0
void introspect_int80_mmap_return(CPUX86State *env)
{	
	if(introspect_already_alloc == 1) {
		fprintf(stdout, "int80 eax=%x\n", env->regs[R_EAX]);
		env->eip = introspect_info.return_pc;
		//env->regs[R_ESP] = save_all[R_ESP];
		introspect_restore_all(env);
		introspect_info.return_pc = 0;
		introspect_info.introspect_already_alloc = 2;
	}
}
#endif

void helper_introspect_hook(int pc)
{
//	fprintf(stdout, "pc=%x eip=%x eax=%x flags=%d return_pc=%x\n", pc, cpu_single_env->eip, cpu_single_env->regs[R_EAX], introspect_flags, return_pc);

#if 0 //syscall para pages
	if(return_pc == 0 && introspect_already_alloc == 0) {
		introspect_save_all(cpu_single_env);
		introspect_int80_mmap(cpu_single_env);
		return_pc = pc;
		introspect_already_alloc = 1;
		cpu_loop_exit(cpu_single_env);
	}
#endif
	int arg[6];
	int num;
	if(introspect_info.return_pc == 0 && pemu_exec_stats.PEMU_introspect && pc < 0xc0000000) {
#ifdef DEBUG
		fprintf(stdout, "helper_introspect_hook before wait_sc\n");
#endif
		wait_sem_1();

		if(pemu_exec_stats.PEMU_introspect == 0) {
#ifdef DEBUG
		fprintf(stdout, "pemu_exec_stats.PEMU_introspect == 0\n");
#endif
			return;
		}

		num = get_sc_info(arg, &introspect_info.syscall_num);
		introspect_save_all(cpu_single_env);
		introspect_sysenter(cpu_single_env, arg, num);
		introspect_info.return_pc = pc;
#ifdef DEBUG
		fprintf(stdout, "helper_introspect_hook before cpu_loop_exit syscall_num=0x%x\n",
				introspect_info.syscall_num);
#endif
		cpu_loop_exit(cpu_single_env);
	}
//#endif
}

int introspect_enter_PEMU(int sysnum, int arg1, int arg2, int arg3,int arg4, int arg5, int arg6)
{
#ifdef DEBUG
	fprintf(stdout, "introspect_enter_PEMU\n");
#endif
	return do_syscall_policy(sysnum, arg1, arg2, arg3, arg4, arg5, arg6);
	//do_introspect(sysnum, arg1, arg2, arg3, arg4, arg5, arg6);

#if 0
	if(sysnum == 0x40)
		return do_introspect(0);
	else {
		return syscall(sysnum, arg1, arg2, arg3, arg4, arg5, arg6);
	}
#endif
}

void init_introspect(void)
{
	init_sig();
	//PEMU_start_PEMUThread();
}

//unsigned short buf;
//cpu_memory_rw_debug(cpu_single_env, 0xc10279c8, &buf, 2, 0);
//cpu_single_env->eip = 0xc10279c8;
