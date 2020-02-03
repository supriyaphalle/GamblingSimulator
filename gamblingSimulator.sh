#! /bin/bash 

echo "Welcome to the GamblingSimulator"

stake=100;
bet=1;

MAX_VALUE=$(($stake+50*$stake / 100))
MIN_VALUE=$(($stake-50*$stake/100))

while (( (($stake < $MAX_VALUE)) && (($stake > $MIN_VALUE)) ))
do
	if (( $((RANDOM%2))==$bet))
	then
#		echo "win the bet"
		stake=$(($stake+1))
	else
#		echo "loose the bet"
		stake=$(($stake-1))
	fi

done
	echo "resign the game with stake of $stake"




