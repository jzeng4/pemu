#ifndef SYSTEMCALL_API_H
#define SYSTEMCALL_API_H

#include "basic_types.h"
#include "thread_api.h"
#include "context_manipulation_api.h"
#include "generic_inspection_api.h"

typedef VOID(* 	SYSCALL_ENTRY_CALLBACK )(THREADID threadIndex, CONTEXT *ctxt, SYSCALL_STANDARD std, VOID *v);
typedef VOID(* 	SYSCALL_EXIT_CALLBACK )(THREADID threadIndex, CONTEXT *ctxt, SYSCALL_STANDARD std, VOID *v);

VOID PIN_AddSyscallEntryFunction (SYSCALL_ENTRY_CALLBACK fun, VOID *val);
VOID PIN_AddSyscallExitFunction (SYSCALL_EXIT_CALLBACK fun, VOID *val);
VOID PIN_SetSyscallArgument (CONTEXT *ctxt, SYSCALL_STANDARD std, UINT32 argNum, ADDRINT val);
ADDRINT PIN_GetSyscallArgument (const CONTEXT *ctxt, SYSCALL_STANDARD std, UINT32 argNum);
VOID PIN_SetSyscallNumber (CONTEXT *ctxt, SYSCALL_STANDARD std, ADDRINT val);
ADDRINT PIN_GetSyscallNumber (const CONTEXT *ctxt, SYSCALL_STANDARD std);
ADDRINT PIN_GetSyscallReturn (const CONTEXT *ctxt, SYSCALL_STANDARD std);
ADDRINT PIN_GetSyscallErrno (const CONTEXT *ctxt, SYSCALL_STANDARD std);

#endif
