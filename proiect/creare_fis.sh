#!/bin/bash

if [ -f lista.csv ]
  then
    read -p "Pentru a rescrie continutul fisierului tastati "da": " raspuns
    while [ true ]
      do
        case $raspuns in 
          da)
            echo 'id,nume,varsta,email,salariu' > lista.csv
            echo "Fisierul a fost recreat cu succes."
            break 2;;
          *)
            break 2;;
        esac
      done
else
  echo 'id,nume,varsta,email,salariu' >lista.csv
  echo "Am creat fisierul"
fi

exit
