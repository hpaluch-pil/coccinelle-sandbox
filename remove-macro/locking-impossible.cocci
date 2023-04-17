@ret_wo_release@
constant C;
@@
  acquire_lock();
  ... when != release_lock();
- return (C);
+ my_return (C);
  

// this rule with '-' will fail with error:
// the line 'release_lock(); return (C);' matches my_return(C); with some glitches.
// macros.h: 2: try to delete an expanded token: return 
// note: identifier UNLOCK is required to avoid skipping source without direct release_lock() call
@release_wo_lock exists@
constant C2;
identifier UNLOCK =~ "^release_lock$";
@@
  ... when != acquire_lock();
- UNLOCK(); return (C2);
// - release_lock(); return (C);
// + return (C);
// but this works:
//   release_lock(); return (C);
// + some_call (C);

