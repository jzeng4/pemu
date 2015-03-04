#ifndef __LINUX_H__
#define __LINUX_H__


//#include "qemu-pemu.h"
//#include "cpu.h"


typedef struct _Libc_item{
	char name[100];
}Libc_item;


struct koffset {
    char version[128]; 
    unsigned int hookingpoint;
    unsigned int hookingpoint2; 
    unsigned int taskaddr; 
    int tasksize; 
    int listoffset; 
    int pidoffset; 
    int mmoffset; 
    int pgdoffset; 
    int commoffset; 
    int commsize; 
    int vmstartoffset; 
    int vmendoffset;
    int vmnextoffset; 
    int vmfileoffset;
    int vmflagsoffset;	
    int dentryoffset; 
    int dnameoffset; 
    int dinameoffset;
	unsigned int kmem_cache_alloc_addr;
	unsigned int kmem_cache_free_addr;
}; 

struct PEMU_guest_os{
	unsigned int hookingpoint;
	unsigned int hookingpoint2;
	unsigned int taskaddr;
	int tasksize;
	int listoffset;
	int pidoffset;
	int mmoffset;
	int pgdoffset;
	int commoffset;
	int commsize;
	int vmstartoffset;
	int vmendoffset;
	int vmnextoffset;
	int vmfileoffset;
	int vmflagsoffset;	
	int dentryoffset;
	int dnameoffset;
	int dinameoffset;
	unsigned int kmem_cache_alloc_addr;
	unsigned int kmem_cache_free_addr;
};

#if 0
extern unsigned int PEMU_start;
extern unsigned int PEMU_task_addr;
extern unsigned int PEMU_main_start;
extern unsigned int PEMU_img_start;
extern unsigned int PEMU_img_end;
extern unsigned int PEMU_txt_start;
extern unsigned int PEMU_txt_end;
extern unsigned int PEMU_cr3;
extern unsigned int hookingpoint;

extern unsigned int g_pc;
extern unsigned int g_start_pc;
extern unsigned int g_main_start;
extern char g_inst_buffer[15];
#endif

extern struct PEMU_guest_os pemu_guest_os;

#endif
