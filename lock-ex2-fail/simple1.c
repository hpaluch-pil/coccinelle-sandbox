// file: sipmle1.c
int ok_example1(void)
{
	int a = 1;
	acquire_lock();
	a++;
	my_return(345);
}


