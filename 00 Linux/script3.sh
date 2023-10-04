# Contenido del ejercicio 1 con el texto como parámetro

# Condicional si no se introduce ningún texto
if [[ $# -eq 0 ]]; then
 message='Qué me gusta la bash!!!!'
else
 message=$1
fi

# Se continúa normalmente el proceso del ejercicio 1
mkdir -p foo/{dummy,empty}
touch foo/dummy/file{1,2}.txt
echo $message > foo/dummy/file1.txt

# Contenido del ejercicio 2
cat foo/dummy/file1.txt > foo/dummy/file2.txt
mv foo/dummy/file2.txt foo/empty/

# Fin del script. Para ejecutarlo:
# chmod +x script_ejercicio_3.sh
# ./script_ejercicio_3.sh 'Me encanta la bash!!'
# Si no le incluimos argumento, asumirá su propio mensaje:
# ./script_ejercicio_3.sh
# Incluyendo el mensaje: 'Qué me gusta la bash!!!!'