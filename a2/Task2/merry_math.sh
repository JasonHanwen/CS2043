#! /bin/bash
if [ "$#" -lt 3 ]; then
  echo there are too few parameters
  exit 64
fi
FileName = "$1"

if [ ! -f $FileName ]; then
    echo "the file does not exist"
    exit 64
fi
operation = "$2"

touch RESULT.txt
if [ $operation -ne add] && [ $operation -ne sub] && [ $operation -ne mul] && [ $operation -ne div] ; then
    echo the operation is not valid
    exit 1
if
num= 1;

cat "$1" while read line
do
  echo "Line is :" $line
done < RESULT.txt


while read line; do
  IN="$line"
  IFS=',' read -ra ADDR <<< "$IN"
  l="${ADDR[$3-1]}"
  for i in ${@:4} ; do
    r="${ADDR[$i-1]}"
    case "$2" in
       "add") l="$(($l+$r))"
       ;;
       "sub") l="$(($l-$r))"
       ;;
       "mul") l="$(($l*$r))"
       ;;
       "div") l="$(($l/$r))"
       ;;
    esac
  done
  echo "$l" >> RESULTS.txt
done
