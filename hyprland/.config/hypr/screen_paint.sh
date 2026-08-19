#!/bin/bash

PAINT=$(cat /tmp/my_var || echo 0)
PAINT="${PAINT//[[:space:]]/}"

if [[ $PAINT -eq 0 ]]; then
	gromit-mpx -a
	echo 1 > /tmp/my_var
else
	gromit-mpx -c && gromit-mpx -a
	echo 0 > /tmp/my_var
fi
