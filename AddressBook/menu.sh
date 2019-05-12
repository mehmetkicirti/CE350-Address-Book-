#!/bin/bash
while true
do

dialog --clear --title "MENU" --menu "MAIN-Menu" 15 50 6 1 "ADD" 2 "DELETE" 3 "UPDATE" 4 "LIST" 5 "SEARCH" 6 "EXIT" 2> .choice

choice="$(cat .choice)"
Choice=$(find -type f -name ".choice")
rm -rf $Choice
case $choice in 
	1) ./add.sh;;
	2)./delete.sh;;
	3)./update.sh;;
	4)./list.sh;;
	5)./search.sh;;
	6)dialog --clear --title "EXIT" --msgbox "See you.." 5 20 
	exit;;
	esac

done
