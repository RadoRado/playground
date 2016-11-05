#!/bin/bash

echo $*
echo $?
echo $#

# [ $# -eq 0 ] && directorys=`pwd` || directorys=$@

if [[ $# -eq 0 ]]
then
  directories=`pwd`
else
  directories="$@"
fi


echo "$directories"
