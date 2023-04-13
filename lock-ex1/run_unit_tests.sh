#!/bin/bash

# run "unit tests" on *.cocci rules - where expected results
# are available in results

set -e
d="$(dirname "$0")"


if [ $# -gt 0 ]; then
	tests="$@"
else
	tests="$d/"*.cocci
fi

summary_file=`mktemp`
trap "rm -f -- $summary_file" RETURN
ret=0


for t in $tests
do
	[[ $t =~ .*\.cocci$ ]] || {
		echo "Test file '$t' has wrong suffix - expected .cocci" >&2
		exit 1
	}
	[ -r "$t" ] || {
		echo "Unable to read test-file '$t'" >&2
		exit 1
	}
	echo "Running test '$t'..."
	dn="$(dirname "$t")"
	bn0="$(basename "$t" .cocci)"
	bn=${t%%.cocci}
	c_file="$bn.c"
	[ -r "$c_file" ] || {
		echo "Unable to find '$c_file' file for '$t'" >&2
		exit 1
	}
	exp_result="${dn}/results/$bn0.c.cocci_res"
	[ -r "$exp_result" ] || {
		echo "Unable to find expected results file '$exp_result'" >&2
		exit 1
	}
	cocci_result="${dn}/$bn0.c.cocci_res"
	rm -f -- "$cocci_result"
	cmd="spatch --out-place --sp-file "$t" "$c_file""
	echo "INFO: Running '$cmd'..."
	$cmd || {
		echo "spatch command returned fatal error=$?" >&2
		exit 1
	}
	[ -r "$cocci_result" ] || {
		echo "spatch did not produced '$cocci_result' file" >&2
		exit 1
	}
	if diff -u "$cocci_result" "$exp_result" ;then 
		echo
		echo "OK: $t PASSED" | tee -a $summary_file
		echo
	else 
		echo "ERROR: test $t diff $cocci_result <> $exp_result FAILED " >> $summary_file
		echo "ERROR: spatch produced unexpected results" >&2
		echo "ERROR: Compare by yourself '$cocci_result' with '$exp_result'" >&2
		ret=1
	fi
	rm -f -- "$cocci_result"
done
echo
cat $summary_file
exit $ret

