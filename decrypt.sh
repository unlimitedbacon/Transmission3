#!/bin/bash

for password in $(cat passwords.txt)
do
	#for cipher in $(openssl list-cipher-commands)
	for cipher in $(cat ciphers.txt)
	do
		echo -n "Cipher: $cipher	Password: $password	"
		openssl enc -d -$cipher -salt -in 1.bin -out 1.bin.txt -pass pass:"$password" 2> /dev/null
		success=$?
		if [ $success == 0 ]; then
			echo "SUCCESS!"
			for file in $(ls *.bin)
			do
				echo $file
				openssl enc -d -$cipher -in $file -out $file.txt -pass pass:"$password"
			done
			break
		fi
		echo "FAIL"
	done
	if [ $success == 0 ]; then
		break
	fi
done
