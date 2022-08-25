#! /bin/bash

list="/c/Users/User/Desktop/gajju/*" # source folder files path
for file in $list 
do 
#echo $file 
substring=$(echo $file | cut -d '/' -f 7)  #-d (--delimiter)
#echo $substring 
foldername=`echo $substring | awk -F. '{ print $1 }'`  #-F fs To specify a file separator
#echo $foldername 
rm -rf $foldername
mkdir $foldername;
subfoldrename=`echo $substring | awk -F. '{ print $2 }'` 
#echo $subfoldrename 
cd $foldername
rm -rf $subfoldrename 

mkdir $subfoldrename 
 
#echo $(pwd)

#cd $subfoldrename
#echo $(pwd)
mv -f $file $subfoldrename
cd ..
#echo $(pwd)
done 
