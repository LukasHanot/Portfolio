#!/bin/bash
starttijd=`date +%s%N`
zenity --warning --title "Hallo" --text "`date`"
eindtijd=`date +%s%N`
let totaal=$eindtijd-$starttijd
echo "Het duurde: $(($totaal)) nanoseconden"
echo "Het duurde: $(($totaal/1000000)) milliseconden"
echo "Het duurde: $(($totaal/1000000000)) seconden"
