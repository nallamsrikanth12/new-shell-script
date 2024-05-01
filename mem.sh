#!/bin/bash
MEM=$(free -m)
MEM_THRESHOLD=200
MESSAGE=""


while  IFS= read -r line
do
  TOTAL_MEMORY_USAGE=$(echo $line | free -m |awk '/Mem/{print $2}' )
  AVALIABLE_USAGE=$(echo $line | free -m |awk '/Mem/{print $3}')
if [ $AVALIABLE_USAGE -ge $MEM_THRESHOLD ]
then
  MESSAGE+= "$AVALIALE_USAGE is more than $MEM_THRESHOLD and total memory is $TOTAL_MEMORY_USAGE mb \n"

fi   

done <<< $MEM

echo -e "message :$MESSAGE"
