@ret_wo_release@
 constant C;
@@
  acquire_lock();
  ...
- return (C);
+ my_return (C);
  
@release_wo_lock exists@
constant C;
@@
  ... when != acquire_lock();
- my_return (C);
+ return (C);
