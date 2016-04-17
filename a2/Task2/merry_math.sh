#! /bin/bash
function usage() {
    echo "Usage:"
    echo "  - Argument 1: the name of file that you want to process"
    echo "  - Argument 2: the operation to the file including add sub mul div"
    echo "  - Argument 3: the columns that you want to process"
    echo " ...... "
}

if [ "$#" -lt 3 ]; then
  echo there are too few parameters
  exit 64
fi

FileName="$1"

if [ ! -f $FileName ]; then
    echo "the file does not exist"
    exit 64
fi

operation="$2"
touch RESULT.txt

if [ "$operation" != "add" ] && [ "$operation" != "sub" ] && [ "$operation" != "mul" ] && [ "$operation" != "div" ]; then
    echo the operation is not valid
    exit 1
fi

for var in "$@"
do
    echo "$var"
done

cat $FileName | while read line; do
  echo "$line"
  echo $line | while IFS=, read -ra arr; do
    echo ${arr[@]}
    l="${arr[$3-1]}"
    for i in ${@:4} ; do
        r="${arr[$i-1]}"
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
    echo "$l"
  done
done
# cat $FileName | while IFS=, read col1 col2
# do
#   echo "I got:$col1|$col2"
# done
# done < RESULT.txt

# while read line; do
#   IN="$line"
#   IFS=',' read -ra ADDR <<< "$IN"
#   l="${ADDR[$3-1]}"
#   for i in ${@:4} ; do
#     r="${ADDR[$i-1]}"
#     case "$2" in
#        "add") l="$(($l+$r))"
#        ;;
#        "sub") l="$(($l-$r))"
#        ;;
#        "mul") l="$(($l*$r))"
#        ;;
#        "div") l="$(($l/$r))"
#        ;;
#     esac
#   done
#   echo "$l" >> RESULT.txt
# done
