#!/bin/bash

csv_file="lista.csv"

# Funcția pentru a crea un fișier CSV nou
create_csv() {
  echo "Introduceți antetul coloanelor separate prin virgulă:"
  read header
  echo "id,$header" > "$csv_file"
  echo "Fișierul CSV a fost creat cu succes."
}

# Funcția pentru a adăuga un rând nou în fișierul CSV
add_row() {
  max_id=$(tail -n +2 "$csv_file" | cut -d ',' -f1 | sort -n | tail -n1)
  new_id=$((max_id + 1))
  echo "Introduceți valorile pentru fiecare coloană separate prin virgulă:"
  read row_values
  echo "$new_id,$row_values" >> "$csv_file"
  echo "Rândul a fost adăugat cu succes în fișierul CSV cu ID-ul: $new_id"
}

# Funcția pentru a șterge o înregistrare pe baza ID-ului
delete_row() {
  echo "Introduceți ID-ul înregistrării pe care doriți să o ștergeți:"
  read delete_id
  if [ grep -q "^$delete_id" csv_file]
   then echo "ID-ul nu a fost gasit. Introdu ID-ul din nou:"
        delete_row
   else
        sed -i "/^$delete_id,/d" "$csv_file"
        echo "Înregistrarea cu ID-ul $delete_id a fost ștearsă cu succes."
  fi
}

# Funcția pentru a afișa numele studenților cu cele mai mari note
show_top_students() {
  echo "Introduceți numărul de studenți pe care doriți să îi afișați:"
  read limit
  echo "Numele studenților cu cele mai mari note:"
  tail -n +2 "$csv_file" | sort -t ',' -k2 -nr | head -n "$limit" | cut -d ',' -f3
}

# Funcția pentru a afișa conținutul fișierului CSV
display_csv() {
  echo "Conținutul fișierului CSV:"
  cat "$csv_file"
}

# Meniul principal
while true; do
  echo
  echo "Meniu:"
  echo "1. Creare fișier CSV"
  echo "2. Adăugare rând în CSV"
  echo "3. Ștergere înregistrare din CSV"
  echo "4. Afișare top studenți după note"
  echo "5. Afișare conținut CSV"
  echo "6. Ieșire"

  read choice

  case $choice in
    1)
      create_csv
      ;;
    2)
      add_row
      ;;
    3)
      delete_row
      ;;
    4)
      show_top_students
      ;;
    5)
      display_csv
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
