#! /bin/bash
if [ "$#" -lt 3 ]; then
  echo the parameter is less than 3
  exit 1
fi

if [ ! -f /tmp/foo.txt ]; then
    echo "File not found!"
fi
touch result.txt

num= 1;
numMin= "$1"
numMax= "$2"
for file in "$@"; do
    if [ $num -lt 3 ] then
        continue
    if
    if [ ! -f $file ]; then
        echo "File not found!"
        continue;
        #do to ooutput the result to the log file
    fi
    #echo every line of a flie
    for line in $file ; do
        echo $line
        num= $(echo $line | wc -w)
        if[ $num -lt $numMax ] || [ $num -gt $numMax ] ; then
            echo the length of this line is to large
        else
            sed -i $line result.txt
        if
    done
done
