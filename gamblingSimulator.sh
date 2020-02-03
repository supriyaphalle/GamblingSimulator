#! /bin/bash 

echo "Welcome to the GamblingSimulator"

#veriables
stake=100;
total_amount=0
win=0;
loose=0;
prev_stake=0;
#Constants
BET=1;

function calculativeGambler() {
	MAX_VALUE=$(($stake+50*$stake / 100))
	MIN_VALUE=$(($stake-50*$stake/100))
	prev_stake=$stake
	amount_per_day=0
	while (( (($stake <= $MAX_VALUE)) && (($stake >= $MIN_VALUE)) ))
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
	echo $amount_per_day
}


for(( i=0;i<20;i++))
do
	calculativeGambler
	total_amount=$(($total_amount + $amount_per_day))

done

if (($total_amount >0))
then
	echo "After 20 days of play, total amount win  = $total_amount"
else
	echo "After 20 days of play, total amount loss  =$(($total_amount * -1))"
fi
