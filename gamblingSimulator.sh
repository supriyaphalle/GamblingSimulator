#!/bin/bash 

echo "Welcome to the GamblingSimulator"

declare -A  amount

#veriables
total_amount=0
win=0;
loose=0;

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
			win=$(($win+1))
		else
			stake=$(($stake-$BET))
			loose=$(($loose+1))
		fi
	done
	amount_per_day=$(($stake-$prev_stake))
}

function gamblerForMonth() {
for(( i=1;i<20;i++))
do
   calculativeGambler
	amount[day$i]=$amount_per_day
	total_amount=$(($total_amount+$amount_per_day))
	if (( ${amount[day$i]}>0 ))
	then
		echo "win of $i day = ${amount[day$i]}"
	else
		echo "loss of $i day = $((${amount[day$i]} ))"
	fi
done
}




#################################### Start Program##################################
gamblerForMonth
if (($total_amount >0))
then
	echo "After 20 days of play, total amount win  = $total_amount"
else
	echo "After 20 days of play, total amount loss  =$(($total_amount * -1))"
fi
#echo ${amount[@]}
