#!/bin/bash

nanoseconden=$(date +%s%N)
echo $nanoseconden
zenity --warning --title "Hallo" --text "`date`"
nanoseconden2=$(date +%s%N)

let verschil=$nanoseconden2-$nanoseconden
let verschil2=$verschil/1000000
let verschil3=$verschil/1000000000
echo $verschil
echo $verschil2
echo $verschil3
