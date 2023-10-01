#!/bin/bash

# Definimos la url como constante (tomamos como ejemplo la que hemos visto en clase):

webpage=http://metaphorpsum.com/paragraphs/10

# Comprobamos que se haya incluido algún elemento como parámetro

if [[ $# -eq 0 ]]; then
 echo 'No ha introducido ningún valor. Por favor introduzca UNA palabra como argumento'
elif [[ $# -lt 1 || $# -gt 1 ]]; then
 echo 'Por favor, introduzca UNA palabra como argumento'
fi

# Si se ha introducido UNA palabra como argumento:

while [ $# -eq 1 ]; do
 curl -s $webpage | grep $1
done