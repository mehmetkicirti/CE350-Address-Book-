#!/bin/bash
    
    dialog --title 'List Person' --textbox address-book.txt 20 70
    dialog --title 'İnfo' --inputbox "Please enter a name to change" 10 30 2>.name
	Name=$(cat .name)
	findName=$(grep "$Name" address-book.txt | awk '{print $1}')
	findNumber=$(grep "$Name" address-book.txt | awk '{print $3}')
	findSurname=$(grep "$Name" address-book.txt | awk '{print $2}')
	findEmail=$(grep "$Name" address-book.txt | awk '{print $4}')
        findAddress=$(grep "$Name" address-book.txt | awk '{print $5}')
	Menu(){
		dialog --title "Menu" --menu "Update Menu" 15 50 6 1 "Change by Name" 2 "Change by Surname" 3 "Change by Phone Number" 4 "Change by Email" 5 "Change by Address" 6 "Go to Menu" 2>.update
		update=$(cat .update)
		Update=$(find -type f -name ".update")
		rm -rf $Update
			case $update in
			   1)ChangeName;;
			   2)ChangeSurname;;
			   3)ChangePhone;;
			   4)ChangeEmail;;
			   5)ChangeAddress;;	
	        	   6)./menu.sh;;
			esac	

	       }
	ChangeName(){
	dialog --inputbox "Current Name : $findName  Please Enter a name to change :" 10 30 2>.name
		changeName=$(cat .name)
		rm -rf .name
		sed -i "s/$findName/$changeName/w address.txt" address-book.txt address-book.csv
		address=$(find -type f -name "address.txt")
		rm -rf $address
	dialog --msgbox "Please Wait Saving Name..." 10 20
		sleep 1
	dialog --msgbox "Saved Name.. Current Name : $changeName" 10 20
		sleep 1
		Menu  
		
		}
	ChangeSurname(){
	dialog --inputbox "Current Surname : $findSurname  Please Enter a surname to change :" 10 30 2>.surname
		changeSurname=$(cat .surname)
		rm -rf .surname
		sed -i "s/$findSurname/$changeSurname/w address.txt" address-book.txt address-book.csv
		address=$(find -type f -name "address.txt")
		rm -rf $address
	dialog --msgbox "Please Wait Saving Surname..." 10 20
		sleep 1
	dialog --msgbox "Saved Surname.. Current Surname : $changeSurname" 10 20
		sleep 1
		Menu  
		}
	ChangePhone(){
	dialog --inputbox "Current Number : $findNumber  Please Enter a number to change :" 10 30 2>.number
		changeNumber=$(cat .number)
		rm -rf .number
		sed -i "s/$findNumber/$changeNumber/w address.txt" address-book.txt address-book.csv
		address=$(find -type f -name "address.txt")
		rm -rf $address
	dialog --msgbox "Please Wait Saving Number..." 10 20
		sleep 1
	dialog --msgbox "Saved Number.. Current Number : $changeNumber" 10 20
		sleep 1
		Menu  
		}
	ChangeEmail(){
		while true
		do
		    dialog --inputbox "Current Email : $findEmail  Please Enter a email to change :" 10 30 2>.email
				changeEmail=$(cat .email)
				rm -rf .email
		    if [[ "$changeEmail" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]
		    then
			dialog --clear --title 'İnfo' --msgbox "Email address $changeEmail is valid." 6 60
			break
		    else
			dialog --clear --title 'İnfo' --msgbox "Email address $changeEmail is invalid." 6 60 
		    fi
		done
		sed -i "s/$findEmail/$changeEmail/w address.txt" address-book.txt address-book.csv
		address=$(find -type f -name "address.txt")
		rm -rf $address
	dialog --msgbox "Please Wait Saving Email..." 10 20
		sleep 1
	dialog --msgbox "Saved Email.. Current Email : $changeEmail" 10 20
		sleep 1
		Menu  
		}
	ChangeAddress(){
	dialog --inputbox "Current Address : $findAddress  Please Enter a address to change :" 10 30 2>.address
		changeAddress=$(cat .address)
		rm -rf .address
		sed -i "s/$findAddress/$changeAddress/w address.txt" address-book.txt address-book.csv
		address=$(find -type f -name "address.txt")
		rm -rf $address
	dialog --msgbox "Please Wait Saving Address..." 10 20
		sleep 1
	dialog --msgbox "Saved Address.. Current Address : $changeAddress" 10 20
		sleep 1
		Menu  
		}
	if [ $Name == $findName ]
	then
		Menu			 
	elif [ $Name != $findVar ]
	then
	dialog --msgbox "Does not exist $Name.." 10 20 
	sleep 1
	./menu.sh
	else
	dialog --msgbox "Does not have any matching name or number" 10 30
 	./menu.sh	  
	fi
