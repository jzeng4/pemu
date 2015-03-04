#ifndef QEMU_PEMU_H
#define QEMU_PEMU_H
#include <xed-interface.h>


#include <stdio.h>
#include <stdlib.h>

uint32_t PEMU_get_reg(xed_reg_enum_t reg_id);
int PEMU_read_mem(uint32_t vaddr, int len, void *buf);
uint32_t PEMU_get_cr3(void);
uint32_t PEMU_get_seg(xed_reg_enum_t reg_id);

#endif
