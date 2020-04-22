#!/bin/bash
elem1=()
elem2=()
set1=""
set2=""
num1=0
num2=0

function Input {
	read -p "Name of Set : " set
	read -p "How many elements in $set1 : " x

	c=0
	while [[ $c -lt $x ]]; do
		if [[ $1 -eq 1 ]]; then
			set1=$set
			num1=$x
			read -p "Set-$set1 Element No.$((c + 1)) : " elem1[c]
		fi
		if [[ $1 -eq 2 ]]; then
			set2=$set
			num2=$x
			read -p "Set-$set2 Element No.$((c + 1)) : " elem2[c]
		fi
		((c++))
	done
}
clear
Input 1
clear
Input 2
clear
echo
echo -n "$set1 = {"
for ((a=0; a<num1; a++)); do
	echo -n ${elem1[a]}
	if [[ $a -lt $((num1 - 1)) ]]; then
		echo -n ", "
	fi
done
echo -n "}"
echo
echo -n "$set2 = {"
for ((a=0; a<num2; a++)); do
	echo -n ${elem2[a]}
	if [[ $a -lt $((num2 -1)) ]]; then
		echo -n ", "
	fi
done
echo -n "}"
echo
until [[ $choice = "3" ]]; do
	choice=""
	
	echo "1) Union"
	echo "2) Interseciton"
	echo "3) Quit"
	echo
	until [[ $choice = [123] ]]; do
		read -p "Choice [1-3] : " choice
	done
	echo "----------------------------------------------"
	if [[ $choice -eq 1 ]]; then
		echo -n "Union = {"
		for ((d=0; d<num1; d++)); do
			for ((e=0; e<num2; e++)); do
				if [[ ${elem1[d]} -eq ${elem2[e]} ]]; then
					echo -n "${elem1[d]}, "
				fi
			done
		done
		echo -en "\b\b}"
		echo
	elif [[ $choice -eq 2 ]]; then
		echo -n "Interseciton = {"
		for ((d=0; d<num1; d++)); do
			z=0
			for ((e=0; e<num2; e++)); do
				if [[ ${elem1[d]} -eq ${elem2[e]} ]]; then
					z=1
				fi
			done
			if [[ $z -eq 0 ]]; then
				echo -n "${elem1[d]}, "
			fi
		done
		echo -en "\b\b}"
		echo
	else
		break
	fi
	echo "----------------------------------------------"
done

