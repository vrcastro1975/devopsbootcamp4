# Ejercicios

## Ejercicios CLI

### 1. Crea mediante comandos de bash la siguiente jerarquía de ficheros y directorios

```bash
foo/
├─ dummy/
│  ├─ file1.txt
│  ├─ file2.txt
├─ empty/
```

Donde `file1.txt` debe contener el siguiente texto:

```bash
Me encanta la bash!!
```

Y `file2.txt` debe permanecer vacío.

EJERCICIO 1. RESOLUCIÓN:

mkdir -p foo/{dummy,empty}
touch foo/dummy/file{1,2}.txt
echo 'Me encanta la bash!!' > foo/dummy/file1.txt

### 2. Mediante comandos de bash, vuelca el contenido de file1.txt a file2.txt y mueve file2.txt a la carpeta empty

El resultado de los comandos ejecutados sobre la jerarquía anterior deben dar el siguiente resultado.

```bash
foo/
├─ dummy/
│  ├─ file1.txt
├─ empty/
  ├─ file2.txt
```

Donde `file1.txt` y `file2.txt` deben contener el siguiente texto:

```bash
Me encanta la bash!!
```

EJERCICIO 2. RESOLUCIÓN

cat foo/dummy/file1.txt > foo/dummy/file2.txt
mv foo/dummy/file2.txt foo/empty/

### 3. Crear un script de bash que agrupe los pasos de los ejercicios anteriores y además permita establecer el texto de file1.txt alimentándose como parámetro al invocarlo

Si se le pasa un texto vacío al invocar el script, el texto de los ficheros, el texto por defecto será:

```bash
Que me gusta la bash!!!!
```
EJERCICIO 3. RESOLUCIÓN
SCRIPT:

#!/bin/bash
# Contenido del ejercicio 1 con el texto como parámetro

# Condicional si no se introduce ningún texto
if [[ $# -eq 0 ]]; then
 message='Qué me gusta la bash!!!!'
else
 message=$1
fi

# Se continúa normalmente el proceso del ejercicio 1
mkdir foo
mkdir foo/dummy
mkdir foo/empty
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


### 4. Crea un script de bash que descargue el contenido de una página web a un fichero y busque en dicho fichero una palabra dada como parámetro al invocar el script

La URL de dicha página web será una constante en el script.

Si tras buscar la palabra no aparece en el fichero, se mostrará el siguiente mensaje:

```bash
$ ejercicio4.sh patata
> No se ha encontrado la palabra "patata"
```

Si por el contrario la palabra aparece en la búsqueda, se mostrará el siguiente mensaje:

```bash
$ ejercicio4.sh patata
> La palabra "patata" aparece 3 veces
> Aparece por primera vez en la línea 27
```
=================================================
El script del ejercicio 4 se ha realizado aparte.
=================================================

### 5. OPCIONAL - Modifica el ejercicio anterior de forma que la URL de la página web se pase por parámetro y también verifique que la llamada al script sea correcta

Si al invocar el script este no recibe dos parámetros (URL y palabra a buscar), se deberá de mostrar el siguiente mensaje:

```bash
$ ejercicio5.sh https://lemoncode.net/ patata 27
> Se necesitan únicamente dos parámetros para ejecutar este script
```

Además, si la palabra sólo se encuentra una vez en el fichero, se mostrará el siguiente mensaje:

```bash
$ ejercicio5.sh https://lemoncode.net/ patata
> La palabra "patata" aparece 1 vez
> Aparece únicamente en la línea 27
```
=================================================
El script del ejercicio 5 se ha realizado aparte.
=================================================