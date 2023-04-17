@r1@
constant C;
position p;
@@
  acquire_lock();
  ... when != release_lock();
  return C;@p
@script:ocaml@
p << r1.p;
@@
Printf.printf "ERROR: plain return() while holding lock! at %s:%d func: %s()\n  Fix: %s\n"
   (List.hd p).file (List.hd p).line (List.hd p).current_element "Use my_return() instead of return()"
  
// Note1: we can't use '- ' rule on expanded macro, it will throw:
// macros.h: 2: try to delete an expanded token: return 
// Note2: identifier UNLOCK is required to avoid skipping source without direct release_lock() call
@r2 exists@
constant C2;
position p;
identifier UNLOCK =~ "^release_lock$";
@@
  ... when != acquire_lock();
  UNLOCK(); return (C2);@p

@script:ocaml@
p << r2.p;
@@
Printf.printf "ERROR: my_return() without holding lock! at %s:%d func: %s()\n  Fix: %s\n"
   (List.hd p).file (List.hd p).line (List.hd p).current_element "Use return() instead of my_return()"

