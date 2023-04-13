set -ex
spatch --sp-file rules1.cocci test.c
exit 0
