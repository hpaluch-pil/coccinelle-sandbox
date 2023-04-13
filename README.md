# Henryk's experimental Coccinell tests

Here are my experimental C flow tests using
Coccinelle tool.

Plase see https://coccinelle.gitlabpages.inria.fr/website/

Tested environment:
OS: Debian 11, Apr 2023

Installed packages:
```bash
sudo apt-get install coccinelle graphviz gv
```

List of projects:

* `lock-ex1/` - simple locking example without preprocessor macros.
  Any call of `acquire_lock()` must be followed with `release_lock()`
  just before return.


