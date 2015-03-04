#ifndef PEMU_HELPER_H
#define PEMU_HELPER_H

#include "linux.h"
#include "pemu.h"

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
//////////////////////////////////////
#if 0
#include "parse_operand.h"


static uint32_t get_call_dest(uint32_t pc)
{
//	xed_inst_t * xi = PEMU_g_xi;
	xed_reg_enum_t reg_id;
	xed_operand_enum_t op_name = PEMU_op_name;
	uint32_t dest = 0;

	if(operand_is_reg(op_name, &reg_id))
	{
		dest = PEMU_get_reg(reg_id);
	}
	else if(operand_is_mem(op_name, &dest, 0))
	{
		uint32_t tmp = dest;
		PEMU_read_mem(tmp, sizeof(dest), &dest);
	}
	else if(operand_is_relbr(op_name, &dest))
	{
		dest += (pc +  xed_decoded_inst_get_length(&PEMU_xedd_g));
	}
	else
	{
		fprintf(stderr, "error: get_call_dest\n");
		exit(0);
	}
	return dest;
}
#endif

#endif
