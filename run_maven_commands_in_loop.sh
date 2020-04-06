#!/bin/bash

# This script runs the selected maven related command the number of times the user wants
# to by taking an input integer from the user.
# Created by Akhil Khandelwal
echo "----------------------------------------------------------------"
echo "Which iterable maven command do you want to run?"
echo "1) mvn install"
echo "2) mvn clean install"
echo "3) mvn test"
read switchvar
echo "How many times?"
read j
echo "----------------------------------------------------------------"
i=0
f=0
p=0
command=""
case $switchvar in
	1) 
		command="mvn install"
		;;
	2)
		command="mvn clean install"
		;;
	3)
		command="mvn test"
		;;
	*)
		echo "Invalid"
		exit 0
		;;
esac
for (( i = 1; i <= $j ; i++ ))
do
  echo "-....-....-....-....-....-....-....-....-....-....-"
  echo -e "\e[30;48;5;82mAttempt $i / $j of $command\e[0m"
  echo "-....-....-....-....-....-....-....-....-....-....-"
  eval "$command"
  exitcode=$?
  if [ $exitcode -eq 0 ]
  then
    ((p++))
  fi	
  if [ $exitcode -ne 0 ]
  then
	((f++))
  fi
done

echo -e "\e[97;104mTOTAL RUNS: $j\e[0m"
echo -e "\e[42;97mTOTAL PASS: $p\e[0m"
echo -e "\e[97;101mTOTAL FAILS: $f\e[0m"