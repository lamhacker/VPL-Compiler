#!/bin/bash
set -e

if [ ${#} != 1 ]; then
	echo "Usage: ${0} PATHTOVPL" >&2
	exit 1
fi

VPL=${1%.*}

python ./vpl2asm.py ${VPL}.vpl > ${VPL}.s
gcc -Wall -W -g -static ${VPL}.c ${VPL}.s ./test/base.c -o ${VPL}
