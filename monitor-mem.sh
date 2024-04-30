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

FILES=( find $SOURCE_DIRECTORY -name "*.log" -mtime +14 ) 

while IFS read -r line
do 
  echo " $line :deleting files"
  rm -rf $line
done <<< $FILES