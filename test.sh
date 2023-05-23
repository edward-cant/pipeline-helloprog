#!/bin/bash

function t1()
{
    echo "check if output contains 'bonjour'"
    ./Binaries/main | grep -q "bonjour"
}

function t2()
{
    echo "check if output contains 'monde'"
    ./Binaries/main | grep -q "monde"
}

###

# Initialize test count variables
total=0
pass=0
fail=0

# Increment test count and print result
function report_test {
  ((total++))
  if [[ $1 -eq 0 ]]; then
    ((pass++))
    echo "ok"
  else
    ((fail++))
    echo "FAIL"
  fi
}

###

t1 ; report_test $? "t1"
t2 ; report_test $? "t1"

echo "report: $pass/$total"
exit $fail
