#!/bin/bash
#dialog --textbox address-book.txt 20 70
dialog --clear --inputbox "Enter the name or phone Number that you'd like to delete:" 8 40 2>.deleteLine
deleted=$(cat .deleteLine)
findVar=$(grep $deleted address-book.txt | awk '{print $1}') 
line=$(find -type f -name ".deleteLine")
menu=$(find -type f -name "menu.sh")	
rm -rf $line
l=$(echo -n "$deleted" | wc -c)
if [ $deleted == $findVar ]
then
	dialog --clear --title 'İnfo' --msgbox "Now, Deleting Address $deleted" 10 30
	sed -i "/$deleted/d" address-book.txt address-book.csv	
	sleep 1
	dialog --clear --title 'İnfo' --msgbox "Deleted $deleted" 10 20
	./$menu
elif [ $deleted != $findVar ]
then
	dialog --msgbox 'Does not exist $deleted..' 10 20 
	sleep 1
	./$menu
elif [ $l == 0 ]
then
	dialog --msgbox "Please Give me an input..." 10 20
	./$menu

else
	dialog --msgbox "Does not have any matching name or number" 10 30
 	./$menu		  
fi

