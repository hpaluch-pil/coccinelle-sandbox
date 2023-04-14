#!/bin/bash
set -euo pipefail

args="*.c"
[ $# -eq 0 ] || args="$@"

set -x
spatch --macro-file-builtins macros.h --sp-file *.cocci $args
exit 0
