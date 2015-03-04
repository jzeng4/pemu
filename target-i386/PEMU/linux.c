#include "linux.h"

/*
TEMU is Copyright (C) 2006-2009, BitBlaze Team.

TEMU is based on QEMU, a whole-system emulator. You can redistribute
and modify it under the terms of the GNU LGPL, version 2.1 or later,
but it is made available WITHOUT ANY WARRANTY. See the top-level
README file for more details.

For more information about TEMU and other BitBlaze software, see our
web site at: http://bitblaze.cs.berkeley.edu/
*/

//#include "config.h"

#include <ctype.h>
#include <inttypes.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>

//extern "C"{
#include "qemu-pemu.h"
#include "pemu.h"
#include "linux.h"
//}

//#include <map>
//#include <string>
//using namespace std;


//static map<unsigned int, Libc_item*> libc_map;

/* need to check next_task_struct with the corresponding 
   kernel source code for compatibality 
   in 2.4.20 the next pointer points directly to the next
   tast_struct, while in 2.6.15, it is done through list_head */
static struct koffset kernel_table[] = {
	{
	"2.6.38-8-generic",               /* entry name */
   	0xC1060460, 0x00000000,      /* hooking address: flush_signal_handlers */
	0xC1731F60, /* task struct root */
	3228, /* size of task_struct */
	432, /* offset of task_struct list */
	508, /* offset of pid */
	460, /* offset of mm */
	40, /* offset of pgd in mm */
	732, /* offset of comm */
	16, /* size of comm */
	4, /* offset of vm_start in vma */
	8, /* offset of vm_end in vma */
	12, /* offset of vm_next in vma */
	76, /* offset of vm_file in vma */
	24, /*offset of vm_flags in vma*/
	12, /* offset of dentry in file */
	20, /* offset of d_name in dentry */
	36, /* offset of d_iname in dentry */
	0xc111ac10, /*address of kmem_cache_alloc*/
	0xc111a540  /*address of kmem_cache_free*/
	},
	
	{
	"2.6.32.8",               /* entry name */
   	0xc103913a, 0x00000000,      /* hooking address: flush_signal_handlers */
	0xC136eba0, /* task struct root */
	1072, /* size of task_struct */
	228, /* offset of task_struct list */
	288, /* offset of pid */
	256, /* offset of mm */
	36, /* offset of pgd in mm */
	536, /* offset of comm */
	16, /* size of comm */
	4, /* offset of vm_start in vma */
	8, /* offset of vm_end in vma */
	12, /* offset of vm_next in vma */
	72, /* offset of vm_file in vma */
	0, /*offset of vm_flags in vma*/
	12, /* offset of dentry in file */
	32, /* offset of d_name in dentry */
	92, /* offset of d_iname in dentry */
	0xc10a9a1b, /*address of kmem_cache_alloc*/
	0xc10a997f  /*address of kmem_cache_free*/
	},




  {"", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};

struct PEMU_guest_os pemu_guest_os;

//extern "C"{
int init_kernel_offsets(void)
{
  int retval = -1;
  int i = 0;
 // char buf[128];

//  while (strlen(kernel_table[i].version) != 0) {

    pemu_guest_os.hookingpoint = kernel_table[i].hookingpoint;
    pemu_guest_os.hookingpoint2 = kernel_table[i].hookingpoint2;
    pemu_guest_os.taskaddr = kernel_table[i].taskaddr;
    pemu_guest_os.tasksize = kernel_table[i].tasksize;
    pemu_guest_os.listoffset = kernel_table[i].listoffset;
    pemu_guest_os.pidoffset = kernel_table[i].pidoffset;
    pemu_guest_os.mmoffset = kernel_table[i].mmoffset;
    pemu_guest_os.pgdoffset = kernel_table[i].pgdoffset;
    pemu_guest_os.commoffset = kernel_table[i].commoffset;
    pemu_guest_os.commsize = kernel_table[i].commsize;
    pemu_guest_os.vmstartoffset = kernel_table[i].vmstartoffset;
    pemu_guest_os.vmendoffset = kernel_table[i].vmendoffset;
    pemu_guest_os.vmnextoffset = kernel_table[i].vmnextoffset;
    pemu_guest_os.vmfileoffset = kernel_table[i].vmfileoffset;
	pemu_guest_os.vmflagsoffset = kernel_table[i].vmflagsoffset;
    pemu_guest_os.dentryoffset = kernel_table[i].dentryoffset;
    pemu_guest_os.dnameoffset = kernel_table[i].dnameoffset;
    pemu_guest_os.dinameoffset = kernel_table[i].dinameoffset;

	pemu_guest_os.kmem_cache_alloc_addr = kernel_table[i].kmem_cache_alloc_addr;
	pemu_guest_os.kmem_cache_free_addr = kernel_table[i].kmem_cache_free_addr;
  	retval = 0;
	//fprintf(stderr, "read_linux\t%x\n", hookingpoint);
	return retval;
}


///////////////////////////
static void get_name(uint32_t addr, int size, char *buf)
{
   PEMU_read_mem(addr + pemu_guest_os.commoffset, 16, buf);
}

static uint32_t next_task_struct(uint32_t addr)
{
	uint32_t retval;
	uint32_t next;

    PEMU_read_mem(addr + pemu_guest_os.listoffset + sizeof(uint32_t), 
			sizeof(uint32_t), &next);
    retval = next - pemu_guest_os.listoffset;

  	return retval;
}

static uint32_t get_pid(uint32_t addr)
{
  	uint32_t pid;

  	PEMU_read_mem(addr + pemu_guest_os.pidoffset, sizeof(pid), &pid);
	return pid;
}

static uint32_t get_pgd(uint32_t addr)
{
	uint32_t mmaddr, pgd;
	PEMU_read_mem(addr + pemu_guest_os.mmoffset, sizeof(mmaddr), &mmaddr);
	
	if (0 == mmaddr)
		PEMU_read_mem(addr + pemu_guest_os.mmoffset + sizeof(mmaddr), 
  				sizeof(mmaddr), &mmaddr);

	if (0 != mmaddr)
	   	PEMU_read_mem(mmaddr + pemu_guest_os.pgdoffset, sizeof(pgd), &pgd);
	else
	   	memset(&pgd, 0, sizeof(pgd));

	return pgd;
}

static uint32_t get_first_mmap(uint32_t addr)
{
	uint32_t mmaddr, mmap;
	PEMU_read_mem(addr + pemu_guest_os.mmoffset, sizeof(mmaddr), &mmaddr);

	if (0 == mmaddr)
		PEMU_read_mem(addr + pemu_guest_os.mmoffset + sizeof(mmaddr), 
                   sizeof(mmaddr), &mmaddr);

  	if (0 != mmaddr)
	 	PEMU_read_mem(mmaddr, sizeof(mmap), &mmap);
	else
		memset(&mmap, 0, sizeof(mmap));
	
	return mmap;
}

static void get_mod_name(uint32_t addr, char *name, int size)
{
	uint32_t vmfile, dentry;

	if(PEMU_read_mem(addr + pemu_guest_os.vmfileoffset, sizeof(vmfile), &vmfile) != 0
			|| PEMU_read_mem(vmfile + pemu_guest_os.dentryoffset, sizeof(dentry), &dentry) != 0
			|| PEMU_read_mem(dentry + pemu_guest_os.dinameoffset, size < 36 ? size : 36, name) != 0)
		name[0] = 0;
}

static uint32_t get_vmstart(uint32_t addr)
{
	uint32_t vmstart;
	PEMU_read_mem(addr + pemu_guest_os.vmstartoffset, sizeof(vmstart), &vmstart);
  	return vmstart;
}

static uint32_t get_next_mmap(uint32_t addr)
{
  	uint32_t mmap;
	PEMU_read_mem(addr + pemu_guest_os.vmnextoffset, sizeof(mmap), &mmap);
	return mmap;
}

static uint32_t get_vmend(uint32_t addr)
{
   	uint32_t vmend;
	PEMU_read_mem(addr + pemu_guest_os.vmendoffset, sizeof(vmend), &vmend);
	return vmend;
}

static uint32_t get_vmflags(uint32_t addr)
{
	uint32_t vmflags;
	PEMU_read_mem(addr + pemu_guest_os.vmflagsoffset, sizeof(vmflags), &vmflags);
	return vmflags;
}
/////////////////////////////

int PEMU_find_process(void *opaque)
{
	uint32_t nextaddr = 0;
	char comm[512];
	int count = 0;

	if(!strcmp(pemu_exec_stats.PEMU_binary_name, "")) {
		return 0;
	}
	nextaddr = pemu_guest_os.taskaddr;
	do{
		if (++count > 1000)
			return 0;
	  	get_name(nextaddr, 16, comm);
		if(!strncmp(comm, pemu_exec_stats.PEMU_binary_name, 6))
			break;
		nextaddr = next_task_struct(nextaddr);
	}while(nextaddr != pemu_guest_os.taskaddr);

	if(nextaddr != pemu_guest_os.taskaddr){
		pemu_exec_stats.PEMU_pid = get_pid(nextaddr);
		pemu_exec_stats.PEMU_cr3 = get_pgd(nextaddr) - 0xc0000000;
		pemu_exec_stats.PEMU_task_addr = nextaddr;
		fprintf(stdout, "finding process\t%s\t0x%x\t0x%x\n", comm, pemu_exec_stats.PEMU_pid, pemu_exec_stats.PEMU_cr3);
		return 1;
	}
	return 0;
}

extern size_t sbuf_size;
extern target_ulong user_buf;
void inject_freeGuestPde(void)
{
	int i,j,pde,pte;
	unsigned int cr3 = cpu_single_env->cr[3];
	int flags = 0x67;
	unsigned long start;

	printf("inject_freeGuestPde ... \n");
	for(i = 0x800 - 0x4; i > 0; i -= 4) {
		cpu_physical_memory_rw(cr3 + i, (uint8_t*)&pde, 4, 0);
		if(pde == 0) {
			user_buf = i * 0x100000;
			pde = ram_size + sbuf_size;
			pde = pde | flags;
			cpu_physical_memory_rw(cr3 + i, (uint8_t*)&pde, 4, 1);
			start = ram_size;
			printf("PDE %x %x\n", i*0x100000, pde);
			pde = pde & 0xfffff000;
			for(j = 0 ; j < (sbuf_size) / 0x1000 * 4 ; j += 4) {
				pte = start | flags;
				cpu_physical_memory_rw(pde + j, (uint8_t*)&pte, 4, 1);
				start += 0x1000;
				//printf("pte %x %x\n", pde+j, pte);
			}
			break;
		}
	}
}


//////////////////////////////////////////////
#if 0
void libc_init(void)
{
	char name[100];
	int offset = 0;
	
	FILE *file = fopen("libc.so", "r");
	if(!file){
		fprintf(stderr, "can't find libc.so...\n");
		//return;
		exit(0);
	}

	while(fscanf (file, "%s\t%x\n", name, &offset) != EOF){
		Libc_item *item = (Libc_item *)malloc(sizeof(Libc_item));
		memset(item, 0, sizeof(Libc_item));
		strcpy(item->name, name);
		libc_map[offset] = item;
		
		fprintf(stdout, "%x\t%s\n", offset, name);	
		fflush(stdout);
	}
	fclose(file);
}



Libc_item* hook_libc(unsigned int pc)
{
	char buf[5];
	Libc_item *item;
	uint32_t return_pc;
	uint32_t addr = pc - pemu_exec_stats.PEMU_libc_start;

//	fprintf(stdout, "libc call\t%x\t%x\n", pc, PEMU_libc_start);

	Libc_item *tmp;
	if(tmp = libc_map[addr]){
		fprintf(stdout, "libc call\t%s\n", tmp->name);
		return tmp;
	}


	return 0;

}


void find_main_function(unsigned int pc)
{
	if(pemu_exec_stats.PEMU_main_start != 0)
		return;
	
	Libc_item* tmp = hook_libc(pc);
	if(tmp != 0){
		if(strcmp(tmp->name, "__libc_start_main") == 0){
			uint32_t esp = PEMU_get_reg(XED_REG_ESP);
			char *tt[4];
			PEMU_read_mem(esp+4, 4, tt);
			pemu_exec_stats.PEMU_main_start = *(uint32_t*)tt;
			fprintf(stdout, "main pc:\t%x\n", 
					pemu_exec_stats.PEMU_main_start);
		}
	}
}
#endif
