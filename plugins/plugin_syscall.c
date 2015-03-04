#include "pin.h"
//#include <iostream>
#include <stdio.h>

//using namespace std;

/* ===================================================================== */
/*          Analysis Routines                                            */
/* ===================================================================== */

/* ===================================================================== */
// Print every instruction that is executed.

int count = 0;

VOID syscallEntry(INT32 sysnum){
	count++;
}

VOID syscallExit(INT32 ret){
	printf("Syscall return %d\n", ret);
}

VOID Fini(INT32 code, VOID *v){
	printf("%d\n", count);
}

INT32 Usage(VOID){
   	return 0;
}

VOID *init_main(int argc, char * argv[]){
	if(PIN_Init(argc, argv)) return Usage(); 
	PIN_AddSyscallEntryFunction(syscallEntry, 0);
	//PIN_AddSyscallExitFunction(syscallExit, 0);
	PIN_AddFiniFunction(Fini, 0);
	PIN_StartProgram();
	return 0;
}


/* ===================================================================== */
/* eof                                                                   */
/* ===================================================================== */
