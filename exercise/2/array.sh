#!/bin/bash
#!/bin/bash
NAMES=( John Eric Jessica )

# write your code here
NUMBERS=(1 2 3)
STRINGS=('hello' 'world')
NumberOfNames=${#NUMBERS[@]}
second_name=${NUMBERS[1]}

# Testing Code

# this code should write out the filled arrays, the number of names (3)
# and the second name in the NAMES array (Eric).
echo ${NUMBERS[@]}
echo ${STRINGS[@]}
echo "The number of names listed in the NAMES array: $NumberOfNames"
echo "The second name on the NAMES list is:" ${second_name}
