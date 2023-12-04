cd contenedores-ii
# 1. Crear una imagen con un servidor web Apache y el mismo contenido que en la carpeta content (fijate en el Dockerfile con el que cree simple-nginx)
El dockerfile quedaría así:
---
Dockerfile:
#Imagen que voy a utilizar como base
FROM httpd:2.4

#Etiquetado
LABEL maintainer="victor.castro"
LABEL project="apache-lemoncode"

#Como metadato, indicamos que el contenedor utiliza el puerto 80
EXPOSE 80

#Copiamos el contenido del directorio "content" al directorio donde Apache expone los ficheros html
COPY content/ /usr/local/apache2/htdocs/

---

Ahora vamos a generar la imagen:

docker build . -t simple-apache:new

Si escribimos:
docker image ls, obtenemos:

REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
simple-apache   new       335619335744   14 seconds ago   168MB

Con lo que ya tenemos nuestra imagen creada y personalizada de Apache.


# 2. Ejecutar un contenedor con mi nueva imagen
docker run -d --name myapache -p 5050:80 simple-apache:new

Si escribimos docker ps:

CONTAINER ID   IMAGE               COMMAND              CREATED          STATUS         PORTS                                   NAMES
2ae1c6225392   simple-apache:new   "httpd-foreground"   12 seconds ago   Up 9 seconds   0.0.0.0:5050->80/tcp, :::5050->80/tcp   myapache

Y si nos vamos a un navegador y escribimos en la barra de direcciones:
localhost:5050
Podremos ver la pantalla de bienvenida personalizada por nosotros de Apache:
I'm inside of a container. Help! 


# 3. Averiguar cuántas capas tiene mi nueva imagen
docker inspect simple-apache:new #En el apartado "Layers" pueden contarse cuántas capas hay

Si queremos saberlo de un vistazo, en lugar de eso, podemos poner:
docker inspect simple-apache:new | grep -i -a sha | wc -l
8

docker history simple-apache:new #Todas las acciones que son < 0B son capas

dive simple-apache:new #Puedes ver todas las capas de una imagen

Ahora eliminamos todo:
docker stop (ID del contenedor)
docker container stop myapache
docker container rm myapache
docker image rm $(docker image ls -aq)