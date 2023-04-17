#!/bin/bash
set -euo pipefail

args="*.c"
[ $# -eq 0 ] || args="$@"

set -x
spatch --very-quiet --macro-file-builtins macros.h --sp-file locking-report.cocci $args
exit 0
