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

