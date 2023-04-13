#!/bin/bash
set -euo pipefail
cd $(dirname "$0")
set -x
spatch --macro-file-builtins macros.h --control-flow *.c 
exit 0
