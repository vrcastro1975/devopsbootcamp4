#!/bin/bash

# Definimos la url como constante (tomamos como ejemplo la que hemos visto en clase):

webpage=http://metaphorpsum.com/paragraphs/10

# Si se ha introducido UNA palabra como argumento, pasamos la captura a file.txt y seguimos a partir de ahí:

while [ $# -eq 1 ]; do
 curl -s $webpage > file.txt
done

ocurrencias=[ grep -io $1 < file.txt | wc -l ]
primeravez= [ grep -io $1 < file.txt | ]
if [[ $ocurrencias -eq 0 ]]; then
 echo 'No se ha encontrado la palabra \"$1\"'
else
 echo 'La palabra \"$1\" aparece $ocurrencias veces'
 echo 'Aparece por primera vez en la línea 