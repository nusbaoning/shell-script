#!/bin/bash
#author:Bao Ning
#2017.8.22

#l=(webserver webproxy)
# l=(webproxy)
l=(cvar_example
singlestreamwritedirect
fivestreamreaddirect
singlestreamreaddirect
fivestreamread
fivestreamwritedirect
randomread
randomrw
varmail
filemicro_rwritedsync
singlestreamread
singlestreamwrite
randomwrite
fivestreamwrite
)
run=3700
for str in ${l[@]}; do
	echo "file=$str"
	cd ./$str
	echo $run
	sudo blktrace -d /dev/sdb5 -b 16384 -w $run -o test1 &
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
