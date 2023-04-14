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
