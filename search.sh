#!/bin/bash

dialog --clear --title "SEARCH" --menu "Choose one:" 10 50 3 1 "Search by name" 2 "Search by phone" 3 "RETURN TO THE MENU" 2> .answer
answer="$(cat .answer)"
Answer=$(find -type f -name ".answer")
rm -rf $Answer
case $answer in
	1)dialog --clear --inputbox "Enter the name:" 8 40 2>.name
		name="$(cat .name)"
		grep $name address-book.txt>foundName.txt
		dialog --textbox foundName.txt 20 70
		Name2=$(find -type f -name ".name")
		rm -rf $Name2
		Name=$(find -type f -name "foundName.txt")
		rm -rf $Name
		;;
	2)dialog --clear --inputbox "Enter the phone:" 8 40 2>.phone
		phone="$(cat .phone)"
		grep $phone address-book.txt>foundPhone.txt
		dialog --textbox foundPhone.txt 20 70
		Phone2=$(find -type f -name ".phone")
		rm -rf $Phone2
		Phone=$(find -type f -name "foundPhone.txt")
		rm -rf $Phone
		;;
	3)./menu.sh;;

esac
