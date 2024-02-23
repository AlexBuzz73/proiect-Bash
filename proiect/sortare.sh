#!/bin/bash

numarLinii=$(wc -l < lista.csv)
numarInregistrari=$(($numarLinii-1))
ok="^[0-9]+$"
read -p "Introduceti numarul de angajati pentru sortarea dupa salariu: " numar

while [ true ]
do
 if ! [[ $numar =~ $ok ]]
  then read -p "Ceea ce ati introdus nu este corect. Apasati 1 pentru a incerca din nou sau orice altceva pentru anulare: " raspuns
  if [[ $raspuns -eq 1 ]]
    then read -p "Introduceti numarul de angajati pentru sortarea dupa salariu: " numar
    else break 2
         exit
  fi
 else if [[ $numar -gt  $numarInregistrari ]]
       then read -p "Valoarea introdusa depaseste limita fisierului. Fisierul are $numarInregistrari inregistrari. Apasati 1 pentru a incerca din nou sau orice altceva pentru anulare: " raspuns
       if [[ $raspuns -eq 1 ]]
         then read -p "Introduceti numarul de angajati pentru sortarea dupa salariu: " numar
         else break 2
              exit
       fi
 else if [[ $numar -eq 0 ]]
       then read -p "Ati introdus valoarea 0. Apasati 1 pentru a incerca din nou sau orice alta tasta pentru anulare: " raspuns
            if [[ $raspuns -eq 1 ]]
              then read -p "Introduceti numarul de angajati pentru sortarea dupa salariu: " numar
              else break 2
                   exit
            fi
     else  tail -n +2 lista.csv | sort -t ',' -k5 -nr | head -n $numar
          break 2
     fi
 fi
fi
done

exit
