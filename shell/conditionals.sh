#!/bin/bash

# if COMMAND_WHOSE_EXIT_STATUS_IS_0_UNLESS_ERROR_OCCURRED
#   then echo "Command succeeded."
#   else echo "Command failed."
# fi

E_NOARGS=65

# -z means the length of the string is zero
if [[ -z "$1" && -z "$2" ]]
then
  echo "Usage: ./`basename $0` word filename"
  exit "$E_NOARGS"
fi

if grep -q "$1" "$2"
then
  echo "$2 contains $1"
else
  echo "$2 does not contain $1"
fi
