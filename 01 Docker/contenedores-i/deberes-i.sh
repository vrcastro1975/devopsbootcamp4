#Deberes:
# 1. Crear un contenedor con MongoDB, protegido con usuario y contraseña, añadir una colección, crear un par de documentos y acceder a ella a través de MongoDB Compass
    # Pasos:
    # - Localizar la imagen en Docker Hub para crear un MongoDB
docker search mongo
https://hub.docker.com/_/mongo
    # - Ver qué parámetros necesito para crearlo

# Mac #

docker run -d --name some-mongo \
    -p 27017:27017 \
    -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
    -e MONGO_INITDB_ROOT_PASSWORD=secret \
    mongo

# Desde Compass conectate a tu nuevo MongoDB. Haz clic en la opción Fill in connection fields individually y añade los valores:
# hostname: localhost
# port: 27017
# Authentication: Username and Password
# Las credenciales que hayas puesto
# y haz clic en conectar

#Crea una base de datos que se llame Library y una colección llamada Books. 
# Accede a ella e importa el archivo llamado books.json que se encuentra en el directorio de este ejercicio.
# - Ver los logs de tu nuevo mongo
docker logs some-mongo

Tal y como se describe en el enunciado y en los apuntes, entro en hub.docker.com para ver qué parámetros necesito para crear el contenedor de MongoDB.
Voy a necesitar:
    Puerto: 27017
    Variable para el nombre de usuario: MONGO_INITDB_ROOT_USERNAME
    Variable para la contraseña: MONGO_INITDB_ROOT_PASSWORD

Una vez lo tengo claro todo, levanto el contenedor de MongoDB:

docker run -d --name some-mongo \
    -p 27017:27017 \
    -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
    -e MONGO_INITDB_ROOT_PASSWORD=secret \
    mongo

Ya tengo el contenedor funcionando en localhost:27017. Ahora necesito conectarme a él con Mongo Compass. Para ello, me dirijo a mongodb.com/products/tools/compass y me descargo la aplicación en función de mi sistema (Ubuntu x64, en mi caso).
Una vez que tengo el fichero .deb, lo instalo y ejecuto la aplicación. Como hemos indicado un puerto, un nombre de usuario y una contraseña, nos vamos a "Advanced Connection Options / Authentication / Username/Password y escribimos ahí nuestras credenciales.
Una vez hecho esto, clicamos en "Connect" y ya estaríamos conectados.
Ahora vamos a crear una base de datos llamada "Library" y una colección llamada "Books". Para ello, nos vamos a "Databases" (panel izquierdo) y seleccionamos "+Create database".
En "Database name" escribimos "Library", y en "Collection name" escribimos "Books". A continuación, clicamos en "Create Database".
Ya tendríamos creada nuestra base de datos. Ahora, en lugar de ir metiendo datos a mano, los vamos a importar desde el fichero "books.json" que se nos ha facilitado. Para ello:
"+ADD DATA / Import JSON or CSV file".
Navegamos hasta la ubicación del fichero "books.json" y lo seleccionamos. Una vez seleccionado, clicamos en "Import". Ya tendríamos los datos importados, por lo que podemos ver que se han creado dos nuevas entradas.
Ahora se nos pide que veamos los logs de nuestro nuevo contenedor de MongoDB:

docker logs some-mongo > mongo-logs
Y así lo tenemos guardado en un fichero en lugar de que salga por pantalla.


# 2. Servidor Nginx
#    - Crea un servidor Nginx llamado lemoncoders-web y copia el contenido de la carpeta lemoncoders-web en la ruta que sirve este servidor web. 
#    - Ejecuta dentro del contenedor la acción ls, para comprobar que los archivos se han copiado correctamente.
#    - Hacer que el servidor web sea accesible desde el puerto 9999 de tu local.
docker run --name lemoncoders-web -d -p 9999:80 nginx 
docker cp lemoncoders-web/. lemoncoders-web:/usr/share/nginx/html/
docker exec lemoncoders-web ls /usr/share/nginx/html/


Vamos a hacer al mismo tiempo los pasos 1 y 3:

docker run --name lemoncoders-web -d -p 9999:80 nginx
Ya tendríamos el contenedor funcionando. Podemos comprobarlo en nuestro navegador web escribiendo en la barra de direcciones:
localhost:9999
Con lo que veríamos la pantalla de bienvenida de nginx
Ahora vamos a copiar el contenido de la carpeta del enunciado al contenedor, y recargaremos la página, con lo que podremos comprobar que esta pantalla de bienvenida ha cambiado sensiblemente:

docker cp lemoncoders-web/. lemoncoders-web:/usr/share/nginx/html/

Si recargamos la página ahora, podremos ver los cambios.

Ahora vamos con el paso 2. Vamos a ejecutar un ls dentro del contenedor para ver los ficheros que hemos copiado desde nuestro local al contenedor:

docker exec lemoncoders-web ls /usr/share/nginx/html/


# 3. Eliminar todos los contenedores que tienes ejecutándose en tu máquina en una sola línea. 
docker rm -f $(docker ps -aq)

Para eliminar los contenedores, sería recomendable pararlos antes con docker stop y luego borrarlos con docker rm, pero como nos piden hacerlo con una sóla línea, vamos a forzar la eliminación con el flag "-f":

docker rm -f $(docker ps -aq)

Si quisiéramos ahora borrar también las imágenes, escribiríamos también esto:

docker image rm $(docker image ls)