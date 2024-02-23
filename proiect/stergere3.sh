#!/bin/bash

filename="lista.csv"
numarLinii=$( wc -l < lista.csv )
numarInregistrari=$(($numarLinii-1))
ok="^[0-9]+$"
maxid=$(tail -n +2 < lista.csv | cut -d ',' -f1 | sort -n | tail -n1)


read -p "Introduceți ID-ul înregistrării pe care doriți să o ștergeți: " id

while [[ true ]]
do
  if ! [[ $id =~ $ok ]]; then
    read -p "Ceea ce ati introdus nu este corect. Apasati  1 pentru a incerca din nou sau orice alta tasta pentru anulare: " raspuns
    if [[ $raspuns -eq 1 ]]
      then read -p "Introduceti ID-ul inregistrarii pe care doriti sa o stergeti: " id
      else break 2
           exit
    fi

 else if [[ $id -eq 0 ]] 
        then read -p "Ceea ce ati introdus nu este corect. Apasati 1 pentru a incerca din nou sau orice alta tasta pentru anulare: " raspuns
        if [[ $raspuns -eq 1 ]]
           then read -p "Introduceti ID-ul inregistrarii pe care doriti sa o stergeti: " id 
           else break 2
                exit
        fi

 else if [[ $id -gt $maxid ]]; 
        then read -p "Valoarea introdusa depaseste limita fisierului. Fisierul are $numarInregistrari inregistrari. Apasati 1 pentru a incerca din nou sau orice alta tasta pentru anulare: " raspuns
        if [[ $raspuns -eq 1 ]]
          then read -p "Introduceti ID-ul inregistrarii pe care doriti sa o stergeti: " id
          else break 2
               exit
        fi

      else if grep -q "^$id," "lista.csv";
              then sed -i "/^$id/d" "lista.csv"
              echo "Linia cu ID-ul $id a fost stearsa cu succes"
              break 2
           else echo "Nu exista nicio inregistrare cu ID-ul $id in acest fisier."
                break 2

           fi
      fi
    fi
  fi
done

exit
