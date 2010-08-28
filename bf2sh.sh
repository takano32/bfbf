#!/bin/sh

read LINE

echo PTR=0

N=1
while : ;
do
	CH=`echo $LINE | cut -c $N`
	N=$(($N + 1))
	if [ -z "$CH" ]; then
		break
	fi
	case $CH in
		'>' ) cat << 'EOC'
# >
PTR=$(($PTR + 1))
EOC
		;;
		'<' ) cat << 'EOC'
# <
PTR=$(($PTR - 1))
EOC
		;;
		'+' ) cat << 'EOC'
# +
VAL=VAL_$PTR
VAL=$(($VAL))
eval VAL_$PTR=$(($VAL + 1))
EOC
		;;
		'-' ) cat << 'EOC'
# -
VAL=VAL_$PTR
VAL=$(($VAL))
eval VAL_$PTR=$(($VAL - 1))
EOC
		;;
		'.' ) cat << 'EOC'
# .
VAL=VAL_$PTR
VAL=$(($VAL))
OCH=`echo "obase=8; $VAL" | bc`
OCH=`echo "\0$OCH"`
/bin/echo -n "$OCH"
EOC
		;;
		',' ) cat << 'EOC'
# ,
# CANT IMPLEMENT
#  read VAL
#  eval VAL_$PTR=$VAL
EOC
		;;
		'[' ) cat << 'EOC'
# [
VAL=VAL_$PTR
VAL=$(($VAL))
while [ "$VAL" != "0" ]; do
EOC
		;;
		']' ) cat << 'EOC'
# ]
	VAL=VAL_$PTR
	VAL=$(($VAL))
done
EOC
		;;
		* )
		echo $CH;;
	esac
done

