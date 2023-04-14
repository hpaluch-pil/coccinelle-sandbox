#define my_return(x) do{ \
       	release_lock(); \
       	return x; \
}while(0)


int bug_rel_wo_lock5(void)
{
	int a = 1;
	my_return(123);
}

