#!/bin/bash 

echo "Welcome to the GamblingSimulator"

declare -A  amount
declare -A  winLoss

#variables
totalAmount=0
choice=1
#Constants
INITIAL_STAKE=100
BET=1;
MAX_VALUE=$(($INITIAL_STAKE+50*$INITIAL_STAKE / 100))
MIN_VALUE=$(($INITIAL_STAKE-50*$INITIAL_STAKE/100))
NO_OF_DAYS=20

function calculativeGambler() {
	stake=$INITIAL_STAKE;
	prev_STAKE=$INITIAL_STAKE
	amount_per_day=0
	while (( (($stake < $MAX_VALUE)) && (($stake > $MIN_VALUE)) ))
	do
		if (( $((RANDOM%2))==$BET))
		then
			stake=$(($stake+$BET))
		else
			stake=$(($stake-$BET))
		fi
	done
	amount_per_day=$(($stake-$prev_STAKE))
}

function gamblerForMonth() {
	for ((i=1;i<=NO_OF_DAYS;i++))
	do
		calculativeGambler
		amount[day$i]=$amount_per_day
		totalAmount=$(($totalAmount+$amount_per_day))
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
