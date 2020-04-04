#!/bin/bash

# This shell script takes multiple input filenames as arguments
# and copies them to a "backup_directory" and prints logs to another file

read -p "Please enter file names separated by space: " file_names
touch LOG.txt

if [ -d "backup_directory/" ]
then
	echo "Directory backup_directory exists. Continuing.."
	echo "Directory backup_directory exists. Continuing.." >> LOG.txt
else
	echo "Directory backup_directory not found!. Creating..."
	echo "Directory backup_directory not found!. Creating..." >> LOG.txt
	mkdir backup_directory
fi

for file in $file_names
do
	if [ -f "$file" ]
	then
		echo "$file exists. Copying to backup_directory/"
		echo "Success!"
		echo "$file - SUCCESS!" >> LOG.txt
		cp $file backup_directory/
	else
		echo "$file doesn't exist. Skipping"
		echo "$file - FAILURE!" >> LOG.txt
	fi
done

echo "---------------------------------"
echo "Log file generated:"
cat LOG.txt
echo "---------------------------------"
echo "backup_directory now has the following content:"
ls backup_directory/
echo "---------------------------------"