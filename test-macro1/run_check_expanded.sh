#!/bin/bash
set -euo pipefail
cd $(dirname "$0")
set -x
spatch --macro-file-builtins macros.h --sp-file test_expanded.cocci *.c
exit 0
