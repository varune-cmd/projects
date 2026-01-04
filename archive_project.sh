#!/bin/bah 
#$Revision : 001$
#Sun Jan  4 14:33:06 IST 2026

#Variables 
read -p "enter the directory path to start searching the files larger than 20M : " Base 

Depth=1
Run=0

# checking if directory is present or not 
if [[ ! -d $Base ]] 
then
	echo " directory doesnot exist $Base "
	exit 1
fi 

# checking wheather archive folder exists or not 
if [[ ! -d $Base/archive ]]
then 
	mkdir $Base/archive 
fi 

#finding the list of files larger than 20M 

for i in `find $Base -maxdepth $Depth  -size +20M`
do 
	gzip $i || exit 1 
	mv $i.gz $Base/archive || exit 1 
done 







