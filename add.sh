#!/bin/bash



dialog --inputbox "Enter your name: " 8 60 2>.name
name="$(cat .name)"
dialog --inputbox "Enter your surname:" 8 60 2>.surname
surname="$(cat .surname)"
while true
do
    dialog --clear --title 'İnfo' --inputbox "Please Enter a email" 6 60 2>.email
    email=$(cat .email)
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]
    then
        dialog --clear --title 'İnfo' --msgbox "Email address $email is valid." 6 60
        break
    else
        dialog --clear --title 'İnfo' --msgbox "Email address $email is invalid." 6 60 
    fi
done
dialog --inputbox "Enter a address :" 8 60 2>.address
address="$(cat .address)"
FPhoneNumber(){
dialog --inputbox "Enter the phone number: " 8 60 2>.phone
userPhone="$(cat .phone)"

		
awk '{print $3}' address-book.txt>userPhone.txt
check=$(grep $userPhone userPhone.txt)
	if [ "$userPhone" == "$check" ]
	then 
		dialog --title "ERROR" --msgbox "The same number exist.." 5 75
		dialog --title "ERROR" --yesno "Go Back Menu/Exit.." 5 75
		response2=$?
		
		case $response2 in 0)
			./menu.sh;;
		1)echo "Bye"; break;;
	esac

	else 
	
	dialog --title "Message" --yesno "Are you sure?" 6 25
	response=$?
	case $response in 0)
	Name=$(find -type f -name ".name")	
	Surname=$(find -type f -name ".surname")
	Phone=$(find -type f -name ".phone")
	Email=$(find -type f -name ".email")
 	Address=$(find -type f -name ".address")
	UserPhone=$(find -type f -name "userPhone.txt")
	echo $name $surname $userPhone $email $address >> address-book.txt
	#Convert to csv file
	cat address-book.txt | awk 'BEGIN{print "Name,Surname,PhoneNumber,Email,Address"}{print $1","$2","$3","$4","$5}'>address-book.csv
	rm -rf $Name $Surname $Phone $Email $Address $UserPhone	
	dialog --title "Message" --msgbox "New person created.." 5 75;;
	1) dialog --title "ERROR" --msgbox "Please try again.." 5 75;;
esac

fi
}
FPhoneNumber
