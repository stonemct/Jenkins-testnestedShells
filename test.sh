#!/bin/bash

echo 'run from nested shell script'

echo 'LL: ' + ${LL}
echo 'TT: ' + ${TT}

echo 'eLL: ' + ${eLL}
echo 'eTT: ' + ${eTT}

if [[ ${bashif} != '' ]]; then
    export BASH_IF=${bashif}
    echo 'bashif: ' + ${bashif}
fi

if [[ -z ${bashif} ]]; then
    export BASH_IF=${bashif}+'-z'
    echo 'bashif: ' + ${bashif} + ' -z'
fi
