#!/bin/bash

[[ -d /mnt/vars/indexes/ ]] || mkdir /mnt/vars/indexes/

INODECOUNT=`df -i | grep loop9 | awk '{print $4}'`

task5(){
local run=$1
x=$(( $i * 1000000))
while [ "$INODECOUNT" -gt 1 ]
do
        touch /mnt/vars/indexes/$x
        x=$(( $x + 1 ))
        INODECOUNT=`df -i | grep loop9 | awk '{print $4}'`
done
}

i=$(( ( RANDOM % 10 )  + 1 ))
task5 "$i" &


exit 0

