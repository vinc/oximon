#!/bin/bash

# This script records data from a device into the given directory and
# generates the corresponding graph with gnuplot.
# If no serial port is provided it will try to find one but this can
# only work with some computers running GNU/Linux.
# You will probably have to modify it.

if [ $# -eq 0 ]
then
    echo "Usage: $0 <data_dir> [<serial_port>]"
    exit 1
fi

DATE=$(date +"%Y-%m-%d")
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
OUTPUT_DIR=$1
if [ ! -d $OUTPUT_DIR ]
then
    echo "$0: cannot access '$OUTPUT_DIR': No such directory"
    exit 1
fi

if [ $# -eq 2 ]
then
    PORT=$2
else
    PORT=$(ls -t /dev/ttyUSB* | head -n 1)
fi

if [ "$PORT" == "" ]
then
    echo "$0: cannot find serial port"
    exit 1
fi

if [ ! -r $PORT ]
then
    echo "$0: cannot read '$PORT'"
    exit 1
fi

OUTPUT_DATA="$OUTPUT_DIR/$DATE.dat"
if [ -e $OUTPUT_DATA ]
then
    echo "$0: '$OUTPUT_DATA' exists"
    exit 1
fi
echo "$0: saving data to '$OUTPUT_DATA' ..."
echo "$0: hit '^C' to stop recording"
oximon --port $PORT >> "$OUTPUT_DATA"
TMP_DATA='/tmp/oximon-session.dat'
sed "s/\.\w\+//g" "$OUTPUT_DATA" > $TMP_DATA 

if [ ! -s $TMP_DATA ] || [ $(cat $TMP_DATA | wc -l) -lt 2 ]
then
    echo "$0: no data recorded"
    rm $TMP_DATA 
    exit 1
fi

echo "$0: saving graph to '$OUTPUT_DIR/$DATE.png' ..."
gnuplot $SCRIPT_DIR/graph-session.plt
mv "/tmp/oximon-graph.png" "$OUTPUT_DIR/$DATE.png"
rm $TMP_DATA 
