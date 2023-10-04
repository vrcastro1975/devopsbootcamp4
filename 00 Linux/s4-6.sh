#!/bin/bash

# Comprueba si se proporciona un argumento
if [ $# -eq 0 ]; then
  echo "Proporcione un argumento para buscar."
  exit 1
fi

# Almacena el argumento a buscar en una variable
argumento="$1"

# Nombre del fichero en el que buscar
file="file.txt"

# Verifica si el fichero existe
if [ ! -f "$file" ]; then
  echo "El fichero '$file' no existe."
  exit 1
fi

# Busca el argumento en el fichero y cuenta las ocurrencias
ocurrencias=$(grep -c "$argumento" "$file")

# Si hay al menos una ocurrencia
if [ $ocurrencias -gt 0 ]; then
  # Encuentra la primera línea en la que aparece el argumento
#  primera_linea=$(grep -n "$argumento" "$file" | head -n 1)
  primera_linea=$(grep -n "$argumento" "$file" | head -n 1 | cut -d':' -f1)  
  echo "El argumento '$argumento' aparece $ocurrencias veces en el fichero."
  echo "La primera ocurrencia se encuentra en la línea $primera_linea."
else
  echo "El argumento '$argumento' no se encontró en el fichero."
fi