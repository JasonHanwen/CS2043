#!/bin/bash
# This script is used for generating the data for your assignments A1. Please dont modify this script or change this script
# otherwise it might have unknown consequences and you would not have real data set to work on. Your answers as well to the 
# questions may differ which will not match the actual answers 

dataSetDir='dungeon';

if [[ -d $dataSetDir || -f $dataSetDir ]]; then
	echo ""
    echo "(!) The $dataSetDir folder already exists (!)."
    echo "If this is not the assignment folder, but your personal folder, its better you create a new safe directory, Move this launch script to that folder and run this script from that directory. Else if you want to delete it answer the question as y";
    echo ""
    read -r -p "Can I delete it? [y/N] " response
    case $response in
        [yY][eE][sS]|[yY])
			echo "Deleting the dir"
            rm -rf $dataSetDir
            if [ $? -ne 0 ]; then
            	echo "Unable to delete the directory. Check write permissions are enabled on the directory and try later";
            	exit 0;
            fi;
            
            ;;
        *)
            # User responded with a no, or invalid answer
            echo "Ok, I'll let you do that instead.  Run this script again when you are ready."
            exit 0
            ;;
    esac
fi;

url='http://www.gutenberg.org/cache/epub/5200/pg5200.txt';

fileName="pg5200.txt";
mkdir $dataSetDir;

cd $dataSetDir;
curl -O "$url";

#cp "../$fileName" .
generatedFilePrefix='ranz_kafka_meta_';
split -l 5 $fileName "$generatedFilePrefix";
rm "$fileName";

for d in {a..z}
do
	mkdir $d;
done;
echo ""
echo " ----- Starting to create Data set for you. Please be patient. -----------";
for dir in *;
do
	if [ -d $dir ] ; then
		cd $dir;
		mkdir sub1 sub2 sub3 sub4 sub5;
		newFile="$generatedFilePrefix$dir";
		# #echo $newFile;
		for suffix in {a..e};do
			if [ -f  "../$newFile$suffix" ] ; then
				mv "../$newFile$suffix" sub1
				chmod 000 "sub1/$newFile$suffix";
			fi
		done;
		chmod 000 sub1
		for suffix in {f..j};do
			if [ -f  "../$newFile$suffix" ] ; then
				mv "../$newFile$suffix" sub2
				chmod 000 "sub2/$newFile$suffix";
			fi
		done;
		chmod 000 sub2
		for suffix in {k..o};do
			if [ -f  "../$newFile$suffix" ] ; then
				mv "../$newFile$suffix" sub3
				chmod 000 "sub3/$newFile$suffix";
			fi
		done;
		chmod 000 sub3
		for suffix in {p..t};do
			if [ -f  "../$newFile$suffix" ] ; then
				mv "../$newFile$suffix" sub4
				chmod 000 "sub4/$newFile$suffix";
			fi
		done;
		chmod 000 sub4
		rootDir="sub5";
		for suffix in {u..z};do
			if [ -f  "../$newFile$suffix" ] ; then
				rootDir="$rootDir/sub";
				mkdir "$rootDir";
				mv "../$newFile$suffix" "$rootDir"
				chmod 000 "$rootDir/$newFile$suffix"  
			fi
		done;
		chmod 000 sub5
		cd ..;
		chmod 000 $dir;
	fi
done;

cd ..
chmod 000 $dataSetDir;
echo " ----- Data Set creation is complete for you. Enjoy the assignment. Best of luck !!. -----------";
