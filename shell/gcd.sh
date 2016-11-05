#!/bin/bash
# http://tldp.org/LDP/abs/html/ops.html

# gcd.sh: greatest common divisor
#         Uses Euclid's algorithm

#  The "greatest common divisor" (gcd) of two integers
#+ is the largest integer that will divide both, leaving no remainder.

#  Euclid's algorithm uses successive division.
#    In each pass,
#+      dividend <---  divisor
#+      divisor  <---  remainder
#+   until remainder = 0.
#    The gcd = dividend, on the final pass.
#
#  For an excellent discussion of Euclid's algorithm, see
#+ Jim Loy's site, http://www.jimloy.com/number/euclids.htm.


# ------------------------------------------------------
# Argument check
ARGS_COUNT=2
E_BADARGS=85

if [ $# -ne "$ARGS_COUNT" ]
then
  echo "Usage: `basename $0` first-number second-number"
  exit $E_BADARGS
fi

first_check=$(echo "$1" | grep -q "^[0-9]\+$"; echo $?)
second_check=$(echo "$2" | grep -q "^[0-9]\+$"; echo $?)

if [[ first_check -ne 0 ]]
then
  echo "$1 is not a vali integer"
  exit "$E_BADARGS"
fi

if [[ second_check -ne 0 ]]
then
  echo "$2 is not a vali integer"
  exit "$E_BADARGS"
fi
# ------------------------------------------------------


gcd ()
{

  local dividend=$1             #  Arbitrary assignment.
  local divisor=$2              #! It doesn't matter which of the two is larger.
                          #  Why not?

  local remainder=1             #  If an uninitialized variable is used inside
                          #+ test brackets, an error message results.

  until [[ "$remainder" -eq 0 ]]
  do    #  ^^^^^^^^^^  Must be previously initialized!
    let "remainder = $dividend % $divisor"
    dividend=$divisor     # Now repeat with 2 smallest numbers.
    divisor=$remainder
  done                    # Euclid's algorithm

  echo "$dividend"

}                         # Last $dividend is the gcd.


result=$(gcd $1 $2)

echo; echo "GCD of $1 and $2 = $result"; echo

echo "Should see empty values if local variables are used"
echo "\$divisor: $divisor"
echo "\$divident: $divident"
echo "\$remainder: $remainder"


# Exercises :
# ---------
# 1) Check command-line arguments to make sure they are integers,
#+   and exit the script with an appropriate error message if not.
# 2) Rewrite the gcd () function to use local variables.

exit 0
