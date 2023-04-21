// example of dead-code problem
// $ spatch --control-flow dead-code2.c

extern void release_lock(void);

// weird: this define is not expanded at all...
#define my_return(v) do{ release_lock(); return v; }while(0);

int macro_bug1(int x)
{
	int a = 1;
	acquire_lock();
	
	if ( x == 1)
		my_return(123);
	a++;
	some_call();
	my_return(555);
}

