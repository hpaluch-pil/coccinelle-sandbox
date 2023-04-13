@ret_wo_release@
@@
  acquire_lock();
  ...
(
  release_lock(); return ...;
|
+ release_lock();
  return ...;
)

@release_wo_lock exists@
@@
  ... when != acquire_lock();
- release_lock();
  return ...;

