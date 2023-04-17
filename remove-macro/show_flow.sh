#!/bin/bash
set -euo pipefail
cd $(dirname "$0")
[ $# -eq 1 ] || {
	echo "Usage: $0 file1.c" >&2
	exit 1
}
f="$1"
[[ $f =~ \.c$ ]] || {
	echo "Filename '$f' must end with '.c'" >&2
	exit 1
}
[ -f "$1" ] || {
	echo "ERRR: Filename '$f' is not file." >&2
	exit 1
}
set -x
spatch --macro-file-builtins macros.h --control-flow "$f"
exit 0
