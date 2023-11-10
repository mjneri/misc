#!/bin/sh

counter=0
while [ $counter -lt 10 ]
do
   echo $counter
   counter=$(( $counter + 1 ))
done
printf "\n"
