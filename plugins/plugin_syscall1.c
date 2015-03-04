#include "pin.h"
//#include <iostream>
#include <stdio.h>

//using namespace std;

/* ===================================================================== */
/*          Analysis Routines                                            */
/* ===================================================================== */

/* ===================================================================== */
// Print every instruction that is executed.

void printIp(ADDRINT v, char * dis)
{
    fprintf(stderr, "Ip: 0x%lx %s\n", (unsigned long)v, dis);
}

/* ===================================================================== */
// Print the return value of the system call.

void sysret(ADDRINT v)
{
    fprintf(stderr, "sysret: 0x%lx\n", (unsigned long)v);
}

/* ===================================================================== */
// Print the arguments to the system call.

void sysargs(ADDRINT num,
             ADDRINT p0,
             ADDRINT p1,
             ADDRINT p2,
             ADDRINT p3,
             ADDRINT p4,
             ADDRINT p5
)
{
    fprintf(stderr,"syscall: %ld  sysargs: 0x%lx 0x%lx 0x%lx 0x%lx 0x%lx 0x%lx\n",
        (long)num,
        (unsigned long)p0,
        (unsigned long)p1,
        (unsigned long)p2,
        (unsigned long)p3,
        (unsigned long)p4,
        (unsigned long)p5);
}

VOID SyscallEntry(THREADID threadIndex, CONTEXT *ctxt, SYSCALL_STANDARD std, VOID *v)
{
    sysargs(PIN_GetSyscallNumber(ctxt, std),
        PIN_GetSyscallArgument(ctxt, std, 0),
        PIN_GetSyscallArgument(ctxt, std, 1),
        PIN_GetSyscallArgument(ctxt, std, 2),
        PIN_GetSyscallArgument(ctxt, std, 3),
        PIN_GetSyscallArgument(ctxt, std, 4),
        PIN_GetSyscallArgument(ctxt, std, 5));
}

VOID SyscallExit(THREADID threadIndex, CONTEXT *ctxt, SYSCALL_STANDARD std, VOID *v)
{
    sysret(PIN_GetSyscallReturn(ctxt, std));
}


int init_main(INT32 argc, CHAR *argv[])
{
    PIN_InitSymbols();

    PIN_Init(argc, argv);

    //IMG_AddInstrumentFunction(ImageLoad, 0);
    //INS_AddInstrumentFunction(Ins, 0);
    PIN_AddSyscallEntryFunction(SyscallEntry, 0);
    PIN_AddSyscallExitFunction(SyscallExit, 0);
    
    PIN_StartProgram();
    
    return 0;
}
    
/* ===================================================================== */
/* eof                                                                   */
/* ===================================================================== */
