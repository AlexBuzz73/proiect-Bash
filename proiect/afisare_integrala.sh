#! /bin/bash
while IFS="," read -r val1 val2 val3 val4 val5 #IFS = internal field separator
do
  echo "$val1,$val2,$val3,$val4,$val5"
  echo "------------------------------------"
done < <(tail -n +1 lista.csv)
