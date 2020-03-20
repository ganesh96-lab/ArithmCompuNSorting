#!/bin/bash -x

echo " Welcome to Arithmatic Computation and sorting  Program "

#constant
ARRAY_LENGTH=4

#Read value for a,b,c uc1
read -p "Enter value for a : " a
read -p "Enter value for b : " b
read -p "Enter value for c : " c

#Compute  first Expression uc2
resultExp1=`echo "scale=3; $a + $b * $c" | bc`

#Compute second Expression uc3
resultExp2=`echo "scale=3; $a * $b + $c" |bc`

#Compute third Expression uc4
resultExp3=`echo "scale=3; $c + $a / $b" | bc`

#Compute fourth Expression uc5
resultExp4=`echo "scale=3; $a % $b + $c" | bc`

# store result of Expression in Dictionary
declare -A expResultDict
expResultDict[exp1]=$resultExp1
expResultDict[exp2]=$resultExp2
expResultDict[exp3]=$resultExp3
expResultDict[exp4]=$resultExp4

echo "show Dictionary"
echo "keys : ${!expResultDict[@]}"
echo "value : ${expResultDict[@]}"

#store the dictionary value into array
index=0
for result in ${expResultDict[@]}
do
	expResultArray[index]=$result
	((index++))

done
#print array value
echo "Array" ${expResultArray[@]}

#Sorting of Array in decending order
for (( pass=1; pass<=$(( $ARRAY_LENGTH - 1 )); pass++ ))
do
	for (( index=0; index<= $((ARRAY_LENGTH - pass-1)); index++ ))
	do
		greater=$( echo "${expResultArray[index]} < ${expResultArray[index+1]}" | bc -q ) 
		if [[ $greater -eq  1 ]]
		then
			temp=${expResultArray[index]}
			expResultArray[index]=${expResultArray[index+1]}
			expResultArray[index+1]=$temp

		fi
	done

done

echo "Array in Decending order : " ${expResultArray[@]}

