#ifndef BBL_H
#define BBL_H
//#include "pin.h"
#include "basic_types.h"
#include "instrumentation_arguments.h"
#include "pin_objs.h"

typedef VOID(*BBL_INSTRUMENT_CALLBACK) (BBL, VOID*);

VOID BBL_MoveAllAttributes (BBL fromBbl, BBL toBbl);
UINT32 BBL_NumIns (BBL bbl);
INS BBL_InsHead (BBL x);
INS BBL_InsTail (BBL x);
BBL BBL_Next (BBL x);
BBL BBL_Prev (BBL x);
BOOL BBL_Valid (BBL x);
BOOL BBL_Original (BBL bbl);
ADDRINT BBL_Address (BBL bbl);
USIZE BBL_Size (BBL bbl);
VOID BBL_InsertCall (BBL bbl, IPOINT action, AFUNPTR funptr,...);
VOID BBL_InsertIfCall (BBL bbl, IPOINT action, AFUNPTR funptr,...);
VOID BBL_InsertThenCall (BBL bbl, IPOINT action, AFUNPTR funptr,...);
BOOL BBL_HasFallThrough (BBL bbl);
VOID BBL_AddInstrumentFunction(BBL_INSTRUMENT_CALLBACK func, VOID *val);

#endif
