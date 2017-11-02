#!/bin/sh
#baoning
#08/08/2016
#script to change to do_ftrace working directory and also set tracer
dir=/sys/kernel/debug/tracing
sudo echo > $dir/trace
sudo echo 0 > $dir/tracing_on
sudo cat $dir/trace
sudo echo 1 > $dir/tracing_on
sudo filebench -f fileserver.f
echo 0 > $dir/tracing_on
head $dir/trace
cat $dir/trace > ./data/fileserver_1h.log

