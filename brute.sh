#!/bin/bash

for p1 in {{a..z},{0..9}}
do
	for p2 in {{a..z},{0..9}}
	do
		for p3 in {{a..z},{0..9}}
		do
			for p4 in {{a..z},{0..9}}
			do
			echo "Password: $p1$p2$p3$p4$p5$p6	"
				for p5 in {{a..z},{0..9}}
				do
					for p6 in {{a..z},{0..9}}
					do
						#echo -n "Password: $p1$p2$p3$p4$p5$p6	"
						for file in $(ls *.bin)
						do
							#echo -n "$file	"
							openssl enc -d -aes-256-cbc -salt -in $file -out $file.txt -pass pass:$p1$p2$p3$p4$p5$p6 2> /dev/null
							success=$?
							if [ $success != 0 ]; then
								#echo "FAIL"
								break
							fi
						done
						if [ $success == 0 ]; then
							echo "SUCCESS!"
							echo "Password: $p1$p2$p3$p4$p5$p6	"
							break
						fi
					done
					if [ $success == 0 ]; then
						break
					fi
				done
				if [ $success == 0 ]; then
					break
				fi
			done
			if [ $success == 0 ]; then
				break
			fi
		done
		if [ $success == 0 ]; then
			break
		fi
	done
	if [ $success == 0 ]; then
		break
	fi
done
