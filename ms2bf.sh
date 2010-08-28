#!/bin/sh

while read LINE; do
	N=1
	while : ; do
		CH=`echo $LINE | cut -c $N`
		N=$(($N + 1))
		if [ -z "$CH" ]; then
			break
		fi
		case $CH in
			¢ª|¡Á|¡¼     ) echo '>' ;;
			¢«|¡ú|¡ù       ) echo '<' ;;
			¤¢|¤¡|¤ª|¤© ) echo '+' ;;
			¤Ã|¥Ã       ) echo '-' ;;
			¡ª          ) echo '.' ;;
			¡©          ) echo ',' ;;
			¡Ö|¡Ø       ) echo '[' ;;
			¡×|¡Ù       ) echo ']' ;;
			*           ) ;;
		esac
		if echo $CH | lgrep '¢ª|¡Á|¡¼'; then
			echo '>'
		fi
	done
done


