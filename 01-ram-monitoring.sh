#!/bin/bash

free_space=$(free -mt | grep "Total" | awk '{print $4}')

if [[ $free_space -lt 700 ]]
then 
	echo " Warning, Ram space is running low $free_space M " 
else 
	echo " Ram space is sufficient $free_space M " 
fi

