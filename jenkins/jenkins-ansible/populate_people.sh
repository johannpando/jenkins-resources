#!/bin/bash

counter=0

while [ $counter -lt 50 ]; do
  let counter=counter+1
  #EXTRAE EL NOMBRE Y APELLIDO DE UNA LISTA (NAME,LASTNAME)
  name=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $1}')
  lastname=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $2}')
  #GENERA UN NÚMERO ALEATORIO EN EL RANGO
  age=$(shuf -i 20-25 -n 1)

  #INSERTA EN BBDD
  mysql -u root -p1234 people -e "insert into registro values ($counter, '$name', '$lastname', $age)"
  echo "$counter, $name $lastname, $age was correctly imported"
done