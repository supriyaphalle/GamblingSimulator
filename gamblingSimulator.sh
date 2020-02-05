#!/bin/bash -x

echo "Welcome to the GamblingSimulator"

declare -A  amount
declare -A  winloss

#veriables
total_amount=0

#Constants
stake=100
BET=1;
MAX_VALUE=$(($stake+50*$stake / 100))
MIN_VALUE=$(($stake-50*$stake/100))


function calculativeGambler() {
	stake=100;
	prev_stake=$stake
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
	amount_per_day=$(($stake-$prev_stake))
}

function gamblerForMonth() {
for(( i=1;i<=20;i++))
do
   calculativeGambler
	amount[day$i]=$amount_per_day
	total_amount=$(($total_amount+$amount_per_day))
	echo "Total Amount= $total_amount"
	winloss[day$i]=$total_amount
done
}

function displayTotalAmount() {
	if (($total_amount >0))
	then
		echo "After 20 days of play, total amount win  = $total_amount"
	else
		echo "After 20 days of play, total amount loss  =$(($total_amount * -1))"
	fi
}

#################################### Start Program##################################
gamblerForMonth
displayTotalAmount

printf "Luciest Day : "
for i in ${!winloss[@]}
do
	echo " $i  ${winloss[$i]}"
done | sort -k2 -rn | head -1


printf "Unluciest Day : "
for i in ${!winloss[@]}
do
	echo  "$i ${winloss[$i]}"
done | sort -k2 -rn | tail -1

