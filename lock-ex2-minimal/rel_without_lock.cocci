@rule1 exists@
constant C;
@@
  ... when != acquire_lock();
- my_return(C);
  
