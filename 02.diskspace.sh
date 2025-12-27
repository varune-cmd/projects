#!/bin/bash

FU=$(df -h | egrep -v "Filesystem|tmpfs"| egrep -v "/boot/efi" | grep "/boot" | awk {'print $5'}| tr -d %) 

if [[ $FU -ge 80 ]]
then 
	echo " Warning disk space running out: $FU % "
else 
	echo " Sufficient disk space: $FU %" 
fi 
