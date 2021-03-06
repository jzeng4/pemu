#include"pin_objs.h"
#include<stdio.h>
#include<stdlib.h>
BBL get_BBL(unsigned long pc)
{
	BBL bbl = (BBL) malloc(sizeof(struct Bbl));
	bbl->start_pc = pc;
	bbl->head  = NULL;
	bbl->next = NULL;
	bbl->size = 0;
	bbl->inst_count = 0;
	return bbl;
}

TRACE  get_TRACE(unsigned long pc)
{
	TRACE trace = (TRACE) malloc(sizeof(struct Trace));
	trace->trace_start = pc;
	trace->head  = NULL;
	return trace;
}

INS  get_INS(unsigned long pc)
{
	INS ins = (INS) malloc(sizeof(struct Ins));
	ins->pc = pc;
	ins->next = NULL;
	return ins;
}
