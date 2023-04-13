int ok_example1(void)
{
	int a = 1;
	acquire_lock();
	a++;
	release_lock();
	return 345;
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

int bug_rel_wo_lock(void)
{
	int a = 1;
	release_lock();
	return 123;
}

int bug_no_release(void)
{
	acquire_lock();
	return 456;

}

