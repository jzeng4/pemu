#if 0
#include <dlfcn.h>
#include <stdio.h>
//static void *handle;


void main()
{
#if 0
	char *error;
	handle = dlopen("glibc-2.13-build/libc.so", RTLD_NOW);
	void*(*plugin_main) (void) = dlsym(handle, "init_main");
	if (0 != (error = dlerror())) {
		fprintf(stderr, "error initializing: %s\n", error);
	}
	else {
		plugin_main();
		fprintf(stdout, "PEMU_start\n");
	}
#endif
	printf("%d\n", PEMU_getppid());
}
#endif


#include <sys/resource.h> 
#include <sys/time.h> 
#include <unistd.h> 
#include<stdio.h> 

int init_main () 
{ 
   // Define and object of structure 
   // rlimit. 
   struct rlimit rl; 
  
   // First get the time limit on CPU 
   PEMU_getrlimit (RLIMIT_CPU, &rl); 
  
   //printf("\n Default value is : %lld\n", (long long int)rl.rlim_cur); 
#if 0  
   // Change the time limit 
   rl.rlim_cur = 1; 
  
   // Now call setrlimit() to set the  
   // changed value. 
   setrlimit (RLIMIT_CPU, &rl); 
  
   // Again get the limit and check 
   getrlimit (RLIMIT_CPU, &rl); 
  
   printf("\n Default value now is : %lld\n", (long long int)rl.rlim_cur); 
  
   // Simulate a long time consuming work 
   while (1); 
#endif
   return 0; 
 }
