#!/bin/bash

# Definimos la url como constante (tomamos como ejemplo la que hemos visto en clase):

#Ahora la web se pasa como argumento
# webpage=http://metaphorpsum.com/paragraphs/10

# Si se ha introducido UNA palabra como argumento, pasamos la captura a file.txt y seguimos a partir de ahí:

if [ $# -eq 2 ]; then
  echo 'Ha introducido argumento y url. Bien hecho. Su argumento es:' $1 ; echo 'su url es:' $2
  # Ahora la url es un argumento
  # curl -s $webpage > file.txt
  curl -s $2 > file.txt
  # El resto del script no supone muchos más cambios  
  # Operamos a partir de ahora desde el fichero de texto
  # Almacena el argumento a buscar en una variable
  argumento="$1"
  # Nombre del fichero en el que buscar
  file="file.txt"

  # Busca el argumento en el fichero y cuenta las ocurrencias
  ocurrencias=$(grep -c "$argumento" "$file")

  # Si hay al menos una ocurrencia
  if [ $ocurrencias -gt 0 ]; then
  # Encuentra la primera línea en la que aparece el argumento
   primera_linea=$(grep -n "$argumento" "$file" | head -n 1 | cut -d':' -f1)  
   echo "El argumento '$argumento' aparece $ocurrencias veces en el fichero."
   echo "La primera ocurrencia se encuentra en la línea $primera_linea."
  else
   echo "El argumento '$argumento' no se encontró en el fichero."
  fi
# Si no se introdujo nada o se introdujo más de un argumento:
else
 echo 'Introduzca un argumento y una url separados por un espacio, por favor'
fi