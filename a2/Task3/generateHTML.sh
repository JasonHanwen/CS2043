#! /bin/bash

FileName="$1"
#judge if a file exist
if [ ! -f $FileName ]; then
    echo "the file does not exist"
    exit 64
fi

target="#"
replace="<h>"
cat $FileName | while read line; do
    echo "$line"
    sed -e "s/$target/$replace/g" $FileName
done
