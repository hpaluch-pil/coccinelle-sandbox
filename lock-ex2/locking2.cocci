//   @ret_wo_release@
//   constant C;
//   @@
//     acquire_lock();
//     ... when != release_lock();
//   - return (C);
//   + my_return (C);
  

@release_wo_lock exists@
constant C;
@@
  ... when != acquire_lock();
  release_lock(); return (C);
+ some_call();
