#!/bin/bash 

echo "Welcome to the GamblingSimulator"

declare -A  amount
declare -A  winLoss

#variables
totalAmount=0
choice=1
#Constants
STAKE=100
BET=1;
MAX_VALUE=$(($STAKE+50*$STAKE / 100))
MIN_VALUE=$(($STAKE-50*$STAKE/100))


function calculativeGambler() {
	STAKE=100;
	prev_STAKE=$STAKE
	amount_per_day=0
	while (( (($STAKE < $MAX_VALUE)) && (($STAKE > $MIN_VALUE)) ))
	do
		if (( $((RANDOM%2))==$BET))
		then
			STAKE=$(($STAKE+$BET))
		else
			STAKE=$(($STAKE-$BET))
		fi
	done
	amount_per_day=$(($STAKE-$prev_STAKE))
}

function gamblerForMonth() {
	for(( i=1;i<=20;i++))
	do
		calculativeGambler
		amount[day$i]=$amount_per_day
		totalAmount=$(($totalAmount+$amount_per_day))
	#	echo "Total Amount= $totalAmount"
		winLoss[day$i]=$totalAmount
	done
}

function displayTotalAmount() {
	if (($totalAmount >0))
	then
		echo " total amount win  = $totalAmount"
	else
		echo " total amount loss  =$(($totalAmount * -1))"
	fi
}

function sortValue() {
	for i in ${!winLoss[@]}
	do
		echo " $i  ${winLoss[$i]}"
	done | sort -$1 $2 | head -1
}

#################################### Start Program##################################
while (( $choice==1 ))
do
	totalAmount=0
	gamblerForMonth
	displayTotalAmount
	echo ${winLoss[@]}
	echo ${!winloss[@]}
	printf "Luciest Day : "
	sortValue k2 -rn

	printf "Unluciest Day : "
	sortValue k2 -n
	if (($totalAmount >0))
	then
		echo " if you want to play , press 1"
		read choice
	else
		echo "Thankyou"
		break;
	fi
done
