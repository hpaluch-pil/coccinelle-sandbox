#!/bin/bash
set -euo pipefail
cd $(dirname "$0")
set -x
spatch --control-flow *.c 
exit 0
