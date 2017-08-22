#!/bin/bash
#author:Bao Ning
#2017.8.22

l=(webserver webproxy)
# l=(webserver)
run=6100
for str in ${l[@]}; do
	cd ./$str
	echo $str
	echo $run
	sudo blktrace -d /dev/sdb5 -w $run -o test1 &
	#pid1=$!
	#echo "pid1 = $pid1"
	sudo filebench -f "$str.f"
#&
#pid2=$!
#ps
#echo "pid2 = $pid2"
#wait $pid2
#ps
	#sleep 30s
	#kill -15 $pid1
#ps
	wait
	sudo blkparse -i test1 -o test1.txt
	cd ..	
done
