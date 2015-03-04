#include"trace.h"
#include "../pemu.h"
#include "pin.h"
VOID TRACE_AddInstrumentFunction(TRACE_INSTRUMENT_CALLBACK func, VOID *val)
{
	//fprintf(stderr, "INS_AddInstrumentFunction\n");

	pemu_hook_funcs.trace_hook = func;
}

BBL TRACE_BblHead(TRACE trace)
{
	return trace->head;
}
