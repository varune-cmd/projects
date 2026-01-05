#!/bin/bash
#Revision : 001$
#Mon Jan  5 11:01:03 IST 2026

#Script should execute with sudo or root access

if [[ $UID -ne 0 ]]
then
        echo " Please run with sudo or root .."
        exit 1
fi

#User should provide atleast one argument for username else guide him

if [[ "${#}" -lt 1 ]]
then
        echo " usage: ${0} User_name [comment..] "
        echo " create a user with User_name and comments field of comment "
        exit 1
fi

# store 1st argument as username

User_name=${1}

#Incase of more than one argument store it as account comments
shift
COMMENT="${@}"

#create a password
PASSWORD="$(date +%s%N)"

#create the user
useradd -c "${COMMENT}" -m $User_name

#check wheather the user is successfully create or not
if [[ $? -ne 0 ]]
then
        echo "The account could not be created "
        exit 1
fi

# set the password
echo "$User_name:$PASSWORD" | chpasswd


# check the password is successfully set or not
if [[ $? -ne 0 ]]
then
        echo " password cannot be set "
        exit 1
fi

#Force password change on first login
passwd -e $User_name

#Display the username, password, hostname where it is created
echo
echo " Username : $User_name "
echo
echo " password : $PASSWORD "
echo
echo " host : $(hostname) "

