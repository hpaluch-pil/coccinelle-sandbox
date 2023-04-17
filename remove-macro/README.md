# Example on error when removing macro line

You can see raw error (file `locking-impossible.cocci):

```bash
./run_check_error.sh

+ spatch --macro-file-builtins macros.h --sp-file locking-impossible.cocci simple5.c simple7.c
init_defs_builtins: macros.h
HANDLING: simple5.c simple7.c
macros.h: 2: try to delete an expanded token: return
```

To fix it we may just report offending line (instead of removal)
using `locking-report.cocci`:

```bash
./run_check_ok.sh 
+ spatch --very-quiet --macro-file-builtins macros.h --sp-file locking-report.cocci simple5.c simple7.c
ERROR: plain return() while holding lock! at simple7.c:4 func: bug_no_release()
  Fix: Use my_return() instead of return()
ERROR: my_return() without holding lock! at simple5.c:4 func: bug_rel_wo_lock5()
  Fix: Use return() instead of my_return()
+ exit 0
```

