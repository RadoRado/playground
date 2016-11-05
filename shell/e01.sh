#!/bin/bash

SUCCESS=0
E_NOARGS=65

if [ -z "$1"]
then
  echo "Usage: `basename $0` filename"
  exit "$E_NOARGS"
fi

File="/etc/fstab"

{
  read line1
  read line2
} < $File

echo "$line1"
echo "$line2"

{
  echo "One"
  echo "Two"
  echo "Three"
} > "$1.test"
