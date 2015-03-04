#include "pin_qemu.h"

//#include <stdarg.h>
//#include <stdlib.h>
//#include <stdio.h>
//#include <string.h>
//#include "qemu-pemu.h"
#include <inttypes.h>
#include "cpu.h"
#include "reg32.h"
#include "context_manipulation_api.h"

static unsigned long * pin_regmapping[REG_LAST]; //pin to qemu

void init_pin_regmapping(void *env)
{
	CPUX86State *cpu_single_env = (CPUX86State*)env;
	pin_regmapping[REG_EAX] = &cpu_single_env->regs[R_EAX];
	pin_regmapping[REG_ECX] = &cpu_single_env->regs[R_ECX];
	pin_regmapping[REG_EDX] = &cpu_single_env->regs[R_EDX];
	pin_regmapping[REG_EBX] = &cpu_single_env->regs[R_EBX];
	pin_regmapping[REG_ESP] = &cpu_single_env->regs[R_ESP];
	pin_regmapping[REG_EBP] = &cpu_single_env->regs[R_EBP];
	pin_regmapping[REG_ESI] = &cpu_single_env->regs[R_ESI];
	pin_regmapping[REG_EDI] = &cpu_single_env->regs[R_EDI];
	
	pin_regmapping[REG_EIP] = &cpu_single_env->eip;
	pin_regmapping[REG_EFLAGS] = &cpu_single_env->eflags;

	//TODO: Add more mapping
	
	pin_context = pin_regmapping;
}
