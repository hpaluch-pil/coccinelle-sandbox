#!/bin/bash
set -euo pipefail
cd $(dirname "$0")
set -x
spatch --sp-file *.cocci *.c
exit 0
