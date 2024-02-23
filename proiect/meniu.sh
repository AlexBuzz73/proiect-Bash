#!/bin/bash

while true; do
  echo
  echo "Meniu:"
  echo "1. Creare fisier CSV"
  echo "2. Adaugare rand in CSV"
  echo "3. Stergere inregistrare din CSV"
  echo "4. Afisare top n angajati dupa salariu"
  echo "5. Afisare continut CSV"
  echo "6. Iesire"

  read choice

  case $choice in
    1)
      /bin/bash ./creare_fis.sh
      ;;
    2)
      /bin/bash ./adaugare.sh
      ;;
    3)
      /bin/bash ./stergere3.sh
      ;;
    4)
      /bin/bash ./sortare.sh
      ;;
    5)
      /bin/bash ./afisare_integrala.sh
      ;;
    6)
      echo "Programul a fost încheiat."
      exit 0
      ;;
    *)
      echo "Opțiune invalidă. Vă rugăm să selectați o opțiune validă."
      ;;
esac
done
