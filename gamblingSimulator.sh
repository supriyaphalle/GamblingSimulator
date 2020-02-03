#! /bin/bash 

echo "Welcome to the GamblingSimulator"

#veriables
stake=100;
total_amount=0

#Constants
BET=1;
MAX_VALUE=$(($stake+50*$stake / 100))
MIN_VALUE=$(($stake-50*$stake/100))


for(( i=0;i<20;i++))
do
	while (( (($stake < $MAX_VALUE)) && (($stake > $MIN_VALUE)) ))
	do
		if (( $((RANDOM%2))==$BET))
		then
			stake=$(($stake+1))
		else
			stake=$(($stake-1))
		fi
	done
	total_amount=$(($total_amount+$stake))
done

	echo "After 20 days of play total amount = $total_amount"




