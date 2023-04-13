// file: locking2.c - use my_return() macro instead of 'release_lock();return x;'
int ok_example1(void)
{
	int a = 1;
	acquire_lock();
	a++;
	my_return(345);
}

int ok_example2(void)
{
	int a=5;
	return 456;
}

int ok_example3(void)
{
	some_other_func();
	return 789;
}

int ok_with_branch4(int branch)
{
	if (branch == 1)
		return 123;
	if (branch == 2){
		acquire_lock();
		do_some_stuff();
		my_return(567);
	}
	return 89;
}

int bug_rel_wo_lock5(void)
{
	int a = 1;
	my_return(123);
}

int bug_no_release6(void)
{
	acquire_lock();
	return 456;
}

