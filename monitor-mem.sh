SOURCE_DIRECTORY=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]
then
    echo -e "$G file exists $N"
else
    echo -e "directory is not found"
fi

FILES=$( find $SOURCE_DIRECTORY -name "*.log" -mtime +14 ) 

while IFS= read -r line
do 
  echo " $line :deleting files"
  rm -rf $line
done <<< $FILES

#!/bin/bash

# Function to display memory usage
show_memory_usage() {
    echo "Memory Usage:"
    free -h
}

# Main loop to continuously display memory usage every 5 seconds
while true
do
    clear  # Clear the screen before displaying memory usage
    show_memory_usage
    sleep 5  # Wait for 5 seconds before checking again
done
