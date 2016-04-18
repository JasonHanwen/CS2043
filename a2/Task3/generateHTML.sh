#! /bin/bash

FileName="$1"
#judge if a file exist
if [ ! -f $FileName ]; then
    echo "the file does not exist"
    exit 64
fi
#match the regular expression

target="^#{2}"
replace="<h>"
cat $FileName | while read line; do
    echo "$line" | sed -i -e "s/$target/$replace/g" result.txt
done
