#!/bin/bash

# Definimos la url como constante (tomamos como ejemplo la que hemos visto en clase):

webpage=http://metaphorpsum.com/paragraphs/10

# Si se ha introducido UNA palabra como argumento, pasamos la captura a file.txt y seguimos a partir de ahí:

if [ $# -eq 1 ]; then
    echo 'Ha introducido un sólo argumento. Bien hecho. Su argumento es:' $1
    curl -s $webpage > file.txt
# Operamos a partir de ahora desde el fichero de texto
        ocurrencias=[ grep -io $1 < file.txt | wc -l ]
        echo $ocurrencias
else
 echo 'Introduzca un argumento, por favor'
fi

#  ]
# echo 'Se encontró la primera vez en la línea '
# [ grep -n $1 < file.txt | head -1 | cut -d':' -f 1 ]
# if [[ $ocurrencias -eq 0 ]]; then
#  echo 'No se ha encontrado la palabra \"$1\"'
# else
#  echo 'La palabra \"$1\" aparece $ocurrencias veces'
#  echo 'Aparece por primera vez en la línea 