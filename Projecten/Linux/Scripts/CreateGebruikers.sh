#!/bin/bash

RANGE=22
AantalGebruikers=300
FirstNameList=("Karisa" "Evita" "Berenice" "Hugo" "Krista" "Theola" "Marisa" "Elva" "Jazmine" "Joye" "Bud" "Retta" "Cicely" "Lynell" "Robert" "Chester" "Pattie" "Iona" "Sharron" "Christiane" "Syreeta" "Vivan")  
LastNameList=("Heidt" "Ulrich" "Tien" "Heckart" "Irizarry" Detrick	Burkle Bennefield Stamp	Bicknell Mehr Stong Migues Drone Roysden Hesser Simien Ferraro Weisberg Cornman Birmingham Rossell Holtz Devane	Mcclenton Hayden Padula Rappold	Steinke	Galati Valenzula)  
CountryList=(
    Afghanistan
    Albania
    Algeria
    Andorra
    Angola
    Antigua and Barbuda
    Argentina
    Armenia
    Aruba
    Australia
    Austria
    Azerbaijan
	Bahamas, The
    Bahrain
    Bangladesh
    Barbados
    Belarus
    Belgium
    Belize
    Benin
    Bhutan
    Bolivia
    Bosnia and Herzegovina
    Botswana
    Brazil
    Brunei
    Bulgaria
    Burkina Faso
    Burma
    Burundi
    Cambodia
    Cameroon
    Canada
    Cabo Verde
    Central African Republic
    Chad
    Chile
    China
    Colombia
    Comoros
    Congo, Democratic Republic of the
    Congo, Republic of the
    Costa Rica
    Cote d\'Ivoire
    Croatia
    Cuba
    Curacao
    Cyprus
    Czech Republic)



EmailList=("hotmail.com" "google.com" "live.be" "yahoo.com")
AverageWeight=75

echo "Id, FirstName, LastName, EmailAdres, WeighGoal, Country" > ./Desktop/Gebruikers.csv 
for (( i=1; $i < AantalGebruikers; i++ ))
do
	id=$i
	firstnamenumber=$RANDOM
	let "firstnamenumber %= RANGE"
	firstName=${FirstNameList[$firstnamenumber]}
	
	RANGElastname=31
	lastnamenumber=$RANDOM
	let "lastnamenumber %= RANGElastname"
	lastName=${LastNameList[$lastnamenumber]}

	RANGEemail=4
	emailnumber=$RANDOM
	let "emailnumber %= RANGEemail"
	email=${EmailList[$emailnumber]}
	
	RANGEweight=20
	weightnumber=$RANDOM
	let "weightnumber %= RANGEweight"
	weightgoal=$[AverageWeight+weightnumber]

	RANGEcountries=50
	countrynumber=$RANDOM
	let "countrynumber %= RANGEcountries"
	country=${CountryList[$countrynumber]}	
		
	echo "$id, $firstName, $lastName, $firstName.$lastName@$email, $weightgoal, $country" >> ~/Desktop/LijstGebruikers.csv
echo "De lijst met de gebruikers is weggeschreven naar de Desktop"
done
