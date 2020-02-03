#! /bin/bash -x

echo "Welcome to the GamblingSimulator"

stake=100;
bet=1;

if (( $((RANDOM%2))==$bet))
then
	echo "win the bet"
else
	echo "loose the bet"
fi




