#!/bin/bash

# Email settings
EMAIL_ADDRESS="nallamsrikanth3@gmail.com"
THRESHOLD_PERCENTAGE=90

# Function to display memory usage
show_memory_usage() {
    echo "Memory Usage:"
    free -h
}

# Function to send email alert
send_email_alert(){
    SUBJECT="Memory Usage Alert on myserver"
    MESSAGE="Memory usage has exceeded ${THRESHOLD_PERCENTAGE}% threshold on myserver. Current memory usage:"
    echo "$MESSAGE" | mail -s "$memoryusage" "$nallamsrikanth3@gmail.com"
}

# Main loop to continuously monitor memory usage
while true
do
    MEMORY_USAGE=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')
    
    clear  # Clear the screen before displaying memory usage
    show_memory_usage

    if [ "$(echo "$MEMORY_USAGE >= $THRESHOLD_PERCENTAGE" | bc)" -eq 1 ] 
    then
        echo "send_email_alert"   
    fi

    sleep 300  # Wait for 5 minutes before checking again (300 seconds)
done
