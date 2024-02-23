#!/bin/bash


  echo "Se va adauga o inregistrare noua in fisier"
  max_id=$(tail -n +2 < lista.csv | cut -d ',' -f1 | sort -n | tail -n1)
  new_id=$((max_id + 1))

  while [ true ]
   do
    read -p "Introduceti numele (incepand cu litera mare): " nume
    ok="^[A-Z][a-zA-Z]{2,}$"
    if [[ $nume =~ $ok ]]
      then break;
      else read -p "Ceea ce ati introdus nu este corect. Doriti sa incercati din nou?(da=1---nu=0) " raspuns
        if [[ $raspuns -ne 1 ]]
          then exit
        fi
    fi
   done

  while [ true ]
   do
     read -p "Introduceti numarul de ani vechime: " ani
     ok="^(50|[1-4]?[0-9])$"
      if [[ $ani =~ $ok ]]
      then break;
      else read -p "Ceea ce ati introdus nu este corect.Doriti sa incercati din nou?(da=1---nu=altceva)" raspuns
      if [[ $raspuns -ne 1 ]]
        then exit
      fi
     fi
   done

  while [ true ]
   do
     read -p "Introduceti email-ul: " email
     ok="^[a-zA-Z0-9._%+-]+@[a-zA-Z]{1,}+\.[a-zA-Z]{2,}$"
     if [[ $email =~ $ok ]]
       then break;
       else read -p "Ceea ce ati introdus nu este corect. Doriti sa reincercati?(da=1---nu=0) " raspuns
       if [[ $raspuns -ne 1 ]]
         then exit
       fi
     fi
   done

  while [ true ]
   do
     read -p "Introduceti salariul(numar intreg): " salariu
     ok="^[1-9][0-9]{0,4}$"
     if [[ $salariu =~ $ok ]]
       then break;
       else read -p "Ceea ce ati introdus nu este corect. Doriti sa reincercati?(da=1---nu=0) " raspuns
       if [[ $raspuns -ne 1 ]]
         then exit
       fi
     fi
   done

 echo -n "$new_id,$nume,$ani,$email,$salariu" >> lista.csv
 echo "" >> lista.csv
exit
