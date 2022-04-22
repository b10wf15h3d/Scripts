#!/bin/bash

#############################################################################################################

printf "Please enter IP Address for enumeration... \n"
read -p 'IP Address:' ip
printf "\n\n"

printf "Do you have a username and password to test? \n"
read -p 'Y/N:' creds

if [ $creds = Y ]

	then

printf "What is the username? \n"
read -p 'Username:' username
printf "What is the password? \n"
read -p 'Password:' password

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"

printf "smbmap -H $ip -u $username -p $password \n"
smbmap -H $ip -u $username -p $password

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"

printf "crackmapexec smb $ip -u $username -p $password --shares \n"
crackmapexec smb $ip -u $username -p $password --shares

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"

printf "enum4linux -a $ip -u $username -p $password \n"
enum4linux -a $ip -u $username -p $password

else [ $creds = N ]

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"

printf "smbmap -H $ip \n"
smbmap -H $ip

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"

printf "smbmap -H $ip -u null -p null \n"
smbmap -H $ip -u null -p null

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"

printf "smbclient -N -L //$ip \n" 
smbclient -N -L //$ip

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"

printf "crackmapexec smb $ip \n"
crackmapexec smb $ip

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"

printf "crackmapexec smb $ip --pass-pol -u "" -p "" \n"
crackmapexec smb $ip --pass-pol -u '' -p ''

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"

printf "enum4linux -a $ip \n"
enum4linux -a $ip

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"

fi

print "nmap --script "safe or smb-enum-*" -p 139,445 $ip \n"
nmap --script "safe or smb-enum-*" -p 139,445 $ip 

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"

printf "nmap --script smb-vuln* -Pn -p 139,445 $ip \n"
nmap --script smb-vuln* -Pn -p 139,445 $ip

printf "\n\n"
printf "#############################################################################################################"
printf "\n\n"