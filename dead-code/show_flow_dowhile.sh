#!/bin/bash
set -euo pipefail
cd $(dirname "$0")
set -x
spatch --macro-file-builtins macros_dowhile.h --control-flow --debug-cpp simple1.c
exit 0
