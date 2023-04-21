// example of dead-code problem
// $ spatch --macro-file-builtins macros.h --control-flow dead-code1.c
// init_defs_builtins: macros.h
// FLOW: deadcode detected: File "dead-code1.c", line 23

int macro_bug1(int x)
{
	int a = 1;
	acquire_lock();
	/* unfortunately it is expanded to:
	if ( x == 1){
	   release_lock(); 
	}
	return 123;
	a++;
	...

	which causes (understandably error "dead-code")
	*/
	
	if ( x == 1)
		my_return(123);
	a++;
	some_call();
	my_return(555);
}

