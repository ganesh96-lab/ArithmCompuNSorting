#!/bin/bash -x

echo " Welcome to Arithmatic Computation and sorting  Program "

#Read value for a,b,c uc1
read -p "Enter value for a : " a
read -p "Enter value for b : " b
read -p "Enter value for c : " c

#Compute  first Expression uc2
resultExp1=$(( a + b * c ))

#Compute second Expression uc3
resultExp2=$(( a * b + c ))

#Compute third Expression uc4
resultExp3=$(( c + a / b ))

#Compute fourth Expression uc5
resultExp4=$(( a % b + c )) 
echo $resultExp4
