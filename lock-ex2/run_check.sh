#!/bin/bash
set -euo pipefail
cd $(dirname "$0")
set -x
spatch --macro-file macros.h --sp-file *.cocci *.c
exit 0
