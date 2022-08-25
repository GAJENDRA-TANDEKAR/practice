#!/bin/bash -x


declare -a batsman
declare -a bowlers
choice=0
read -p " enter your chose  1. batsman  2.bowler " choice
case "$choice" in
1) 
echo "for batsman"
read -p " enter  three batsman   " batsman 
batsman=(${batsman})
echo " a ${batsman[0]}"     #a
echo " b ${batsman[1]}"     #b
echo " c ${batsman[2]}"     #c
 echo "for bowler"
read -p " enter  three bowlers   " bowlers 
bowlers=(${bowlers})
echo " 1 ${bowlers[0]}"   #1
echo " 2 ${bowlers[1]}"   #2
echo " 3 ${bowlers[2]}"   #3
echo

if [ ${batsman[0]} == ${bowlers[0]} ] || [ ${batsman[0]} == ${bowlers[1]} ] || [ ${batsman[0]} == ${bowlers[2]} ]
then
echo "${batsman[0]} is allready present in batsman  "
elif [ ${batsman[1]} ==  ${bowlers[0]}  ] || [ ${batsman[1]} == ${bowlers[1]} ] ||[ ${batsman[1]} == ${bowlers[2]} ]
then
echo "${batsman[1]} is allready present in batsman "
elif [ ${batsman[2]} ==  ${bowlers[0]} ] || [ ${batsman[2]} == ${bowlers[1]} ] || [ ${batsman[2]} == ${bowlers[2]} ]
then
echo "${batsman[2]} is allready present in batsman "
else
echo " players are not same "
fi
echo
;;


2)
echo "for bowler"
read -p " enter  three bowlers   " bowlers 
bowlers=(${bowlers})
echo " 1 ${bowlers[0]}"   #1
echo " 2 ${bowlers[1]}"   #2
echo " 3 ${bowlers[2]}"   #3
echo "for batsman"
read -p " enter  three batsman   " batsman 
batsman=(${batsman})
echo " a ${batsman[0]}"     #a
echo " b ${batsman[1]}"     #b
echo " c ${batsman[2]}"     #c

echo
if [  ${bowlers[0]} == ${batsman[0]} ] || [  ${bowlers[0]} == ${batsman[1]} ] || [  ${bowlers[0]} == ${batsman[2]} ]
then
echo "${bowlers[0]} is allready present in bowler "
elif [ ${bowlers[1]} == ${batsman[0]} ] || [ ${bowlers[1]} == ${batsman[1]} ] || [ ${bowlers[1]} == ${batsman[2]} ]
then
echo "${bowlers[1]} is allready present in bowler "
elif [ ${bowlers[2]} == ${batsman[0]} ] || [ ${bowlers[2]} == ${batsman[1]} ] || [ ${bowlers[2]} == ${batsman[2]} ]
then
echo "${bowlers[2]} is allready present in bowler "
else
echo "  players  are not same  "
fi
echo
;;
esac
