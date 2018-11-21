#!/usr/bin/env bash

function printOutcome() {
  local result=$1

  if [[ ${result} = 0 ]]
    then
        echo Test succeeded.
        return
  fi

  echo Test failed with status ${result}.
}

function printOutput() {
    echo $1 | sed 's/^/|  /'
}


function runTests() {
    printf "\nRunning tests...\n"
    cd samples
    for test in ../*.test
    do
        if [[ ${test} != ../testharness.sh ]]
            then
                withoutDots=${test#../}
                withoutExt=${withoutDots%.test}
                printf "\nTest: %s\n" ${withoutExt}

                # Run Test
                testOutput=$(bash ${test})
                testOutcome=$?

                printOutput "${testOutput}"
                printOutcome "${testOutcome}"
        fi
    done
}


# Entry point
runTests