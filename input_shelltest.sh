#!/bin/sh
if [ $# -lt 1 ]; then
   echo "BAD"
   exit 1
fi

hex=$( printf "%#x" $1 )
echo $hex
