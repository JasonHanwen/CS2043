#!/bin/bash


#description
# Nearing the end of the labyrinth, Harry is just one step before reaching his destination. Harry sees four potions labelled `a`, `b`, `c`, and `d` sealed in bottles in front of him. Each bottle contains a key at the bottom, but in order to get the key he has to drink the potion first. There is only one key that will allow Harry to continue.
#
# Harry recalls overhearing Hagrid say that the potion with the highest density has the right key. Harry claims that he does not know "how to math", and asks you to identify which potion he should drink.
#
# The density is defined as the total number of words found in all of the files spread across all of the subdirectories in each potion.


# Make the analysis directory in the correct location.
cd /Users/hanwenwang/Desktop/2016课程/CS2043/CS2043/a1
mkdir analysis
cd analysis
touch a.txt
touch b.txt
touch c.txt
touch d.txt

# Analyze potion (a), and place the results into the appropriate file.
#get the a portion of words
num1= $(find dungeon/a/ -type f -exec wc -w {} + | tail -1 | awk '{print $1;}')
file1= /Users/hanwenwang/Desktop/2016课程/CS2043/CS2043/a1/analysis/a.txt
echo "$num1" > "$file1"

num2= $(find dungeon/b/ -type f -exec wc -w {} + | tail -1 | awk '{print $1;}')
file2= /Users/hanwenwang/Desktop/2016课程/CS2043/CS2043/a1/analysis/b.txt
echo "$num2" > "$file2"

num3= $(find dungeon/c/ -type f -exec wc -w {} + | tail -1 | awk '{print $1;}')
file3= /Users/hanwenwang/Desktop/2016课程/CS2043/CS2043/a1/analysis/c.txt
echo "$num3" > "$file3"

num4= $(find dungeon/d/ -type f -exec wc -w {} + | tail -1 | awk '{print $1;}')
file4= /Users/hanwenwang/Desktop/2016课程/CS2043/CS2043/a1/analysis/d.txt
echo "$num4" > "$file5"

#get the maximum number from num1 to num4, and echo it.
