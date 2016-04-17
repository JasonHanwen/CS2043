#! /bin/bash

function usage() {
    echo "Usage:"
    echo "  - Argument 1: the name of file that you want to process"
    echo "  - Argument 2: the maximum number of words on one line"
    echo "  - Argument 3: the minumum number of words on one line"
}

touch FAILED.log

if [ "$#" -lt 3 ]; then
  echo the parameter is less than 3
  exit 1
fi

FileName=$1

if [ ! -f $FileName ]; then
    echo "File not found!"
    echo "$FileName" >> FAILED.log
    usage
    exit 1
fi

#store the result of the output
touch result.txt

numMin=$2
numMax=$3
fileName=$1

echo "$fileName"
if [ ! -f $file ]; then
    echo "File not found!"
    #do to ooutput the result to the log file
fi
#echo every line of a flie

cat $fileName | while read line; do
    num=$(echo $line | wc -w)
    if [ $num -lt $numMin ] || [ $num -gt $numMax ]; then
        echo "the length of this line is to large"
    else
        echo "$line"
        # sed -i "$line" result.txt
        echo "$line" >> result.txt
    fi
done
