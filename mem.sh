#!/bin/bash

TOTAL_MEMORY_USAGE=$(free -m |awk '/Mem/{print $2}' )

MEM_THRESHOLD=200


while  :
do
  AVALIABLE_USAGE=$(free -m |awk '/Mem/{print $3}')
  echo "system avabile memory is $AVALIABLE_USAGE mb"
if [ $AVALIABLE_USAGE -ge $MEM_THRESHOLD]
then
    echo "$AVALIALE_USAGE is more than $MEM_THRESHOLD and total memory is $TOTAL_MEMORY_USAGE mb"

    #sleep for 1 second
    sleep 1
done