#!/bin/sh
#baoning
#08/08/2016
#script to change to do_ftrace working directory and also set tracer
cd /sys/kernel/debug/tracing
echo "input the tracer you want"
read tracer
echo $tracer > current_tracer
cat current_tracer

