//#include <iostream>
//#include <fstream>
#include "pin.h"
#include "stdio.h"

VOID INS_InsertCall(INS ins, IPOINT action, AFUNPTR funptr, ...);

// The running count of instructions is kept here
// make it static to help the compiler optimize docount
static unsigned long long  icount = 0;

// This function is called before every block
VOID docount2(UINT32 c, uint32_t ip) { 
	icount += c;
}
    
// Pin calls this function every time a new basic block is encountered
// It inserts a call to docount
VOID Trace(TRACE trace, VOID *v)
{
    // Visit every basic block  in the trace
	BBL bbl;
    for (bbl = TRACE_BblHead(trace); BBL_Valid(bbl); bbl = BBL_Next(bbl))
    {
        // Insert a call to docount before every bbl, passing the number of instructions
        BBL_InsertCall(bbl, IPOINT_BEFORE, (AFUNPTR)docount2, IARG_UINT32, BBL_NumIns(bbl),IARG_INST_PTR, IARG_END);
    }
}
// The running count of instructions is kept here
// make it static to help the compiler optimize docount
static UINT32 ucount = 0;
static UINT32 kcount = 0;

// This function is called before every instruction is executed
VOID docount(UINT64 *ucount, UINT64 *kcount, uint32_t ip) 
{
	if(ip < 0xc0000000) {
		++*ucount;
	} else {
		++*kcount;
	}
	qemu_log("IP is %x\n", ip);
}

// Pin calls this function every time a new instruction is encountered
VOID Instruction(INS ins, VOID *v)
{
    // Insert a call to docount before every instruction, no arguments are passed
	INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)docount, IARG_PTR, &ucount, IARG_PTR, &kcount, IARG_INST_PTR, IARG_END);
}

// This function is called when the application exits
VOID Fini(INT32 code, VOID *v)
{
	fprintf(stderr, "rate:%ld %ld %f\n", ucount, kcount, (double)ucount/kcount);
	fprintf(stderr, "Inst count :%lld \n", icount);
}

/* ===================================================================== */
/* Print Help Message                                                    */
/* ===================================================================== */

INT32 Usage()
{
	return 0;
}

/* ===================================================================== */
/* Main                                                                  */
/* ===================================================================== */
/*   argc, argv are the entire command line: pin -t <toolname> -- ...    */
/* ===================================================================== */

void main(int argc, char * argv[])
{
    // Initialize pin
    if (PIN_Init(argc, argv)) return Usage();

    // Register Instruction to be called to instrument instructions
    //INS_AddInstrumentFunction(Instruction, 0);
    TRACE_AddInstrumentFunction(Trace, 0);

    // Register Fini to be called when the application exits

	PIN_AddFiniFunction(Fini, 0);
    
	// Start the program, never returns
    //PIN_StartProgram();
	
	//introspect_enter_pemu();
	//return PEMU_instance;
	return 0;	
}
