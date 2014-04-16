for password in $(cat passwords.txt)
do
	#for cipher in $(openssl list-cipher-commands)
	for cipher in $(cat ciphers.txt)
	do
		echo $cipher $password
		openssl enc -d -$cipher -in 1.bin -out 1.bin.txt -pass pass:$password
		success=$?
		if [ $success == 0 ]; then
			echo "SUCCESS!"
			for file in $(ls *.bin)
			do
				echo $file
				openssl enc -d -$cipher -in $file -out $file.txt -pass pass:$password
			done
			break
		fi
	done
	if [ $success == 0 ]; then
		break
	fi
done
