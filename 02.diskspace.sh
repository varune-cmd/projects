#!/bin/bash

FU=$(df -h | egrep -v "Filesystem|tmpfs"| egrep -v "/boot/efi" | grep "/boot" | awk {'print $5'}| tr -d %) 

TO="ev23btb0a36@student.nitw.ac.in"

if [[ $FU -ge 80 ]]
then 
	echo " Warning disk space running out: $FU % "| mutt -s "Disk space alert!! " $TO
else 
	echo " Sufficient disk space: $FU %" 
fi



