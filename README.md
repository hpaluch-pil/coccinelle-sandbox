# Henryk's experimental Coccinelle tests

Here are my experimental C flow tests using
Coccinelle tool.

Please see https://coccinelle.gitlabpages.inria.fr/website/

Tested environment:
OS: Debian 11, Apr 2023

Installed packages:
```bash
sudo apt-get install coccinelle graphviz gv
```

List of projects:

* `lock-ex1/` - simple locking example without preprocessor macros.
  Any call of `acquire_lock()` must be followed with `release_lock()`
  just before return. This example works properly.
* `lock-ex2` - example with macros - problem is when modified statements
  are part of macro (it will fail) - in our case the problem is caused when
  we need to modify `return` statement.
* `lock-ex3` - using just functions without macro definition. There is problem
  that Coccinelle does not known that `my_return(x)` that looks like function is
  actually macro ending with `return(x);` which affects execution flow significantly.
  Thus legit code may throw error:
  ```
  ret_wo_release: node 24: return ...[1,2,10] in ok_with_branch \
    reachable by inconsistent control-flow paths
  ```
