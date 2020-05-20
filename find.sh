#!/bin/bash
if [ $# -ne 1 ];then
        echo Invalid number of arguments
        exit 0;
fi
word=$1;
found=0;
shift
for fileName in `find -name "*$word"`
do
        if [ -f $fileName ]; then
                evenNrCount=`grep -o "\<[1-9]\{0,1\}[0-9]*[02468]\>" $fileName | wc -w`;
                wordCount=`grep -io "\<[a-z]*\>" $fileName | wc -w`;
                if [ $evenNrCount -eq 0 ] && [ $(($wordCount%2)) -eq 1 ];then
                        echo `ls -l $fileName | awk '{print $1}'` $fileName;
                        found=$(($found+1));
                fi
        fi
done
if [ $found -eq 0 ];then
        echo No such file found!;
fi
