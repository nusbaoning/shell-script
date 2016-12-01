#! /bin/bash 

# variables
trace_path="/sys/kernel/debug/tracing/"
current_tracer="$trace_path"current_tracer
tracing_on="$trace_path"tracing_on
file_path="/home/baoning/Downloads/data/tpcc.log"
trace="$trace_path"trace
# set buffer size
echo 10000000 > "$trace_path"buffer_size_kb

# empty trace
echo 0 > $tracing_on
cat $tracing_on
cat $current_tracer
echo "function" > $current_tracer
echo "nop" > $current_tracer
cat $trace
sleep 1

# open trace
echo 1 > $tracing_on

# run filebench
cd "/home/baoning/Downloads/tpcc-mysql"
./tpcc_start -hlocalhost -dtpcc100 -uroot -pqweruiop -w 10 -c 64 -r 60 -l 600 \
 -f tpcc.log 

# close trace
echo 0 > $tracing_on
# save the trace
cat $trace > $file_path
echo 1000 > "$trace_path"buffer_size_kb
cat $file_path | head -15
echo "finished"