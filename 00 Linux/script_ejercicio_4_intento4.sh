#!/bin/bash

# Definimos la url como constante (tomamos como ejemplo la que hemos visto en clase):

webpage=http://metaphorpsum.com/paragraphs/10

# Si se ha introducido UNA palabra como argumento, pasamos la captura a file.txt y seguimos a partir de ahí:

if [ $# -eq 1 ]; then
 curl -s $webpage | grep -io $1 | wc -l
  if 
fi

# Ahora damos los datos:

