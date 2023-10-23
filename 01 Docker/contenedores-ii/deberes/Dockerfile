#Imagen que voy a utilizar como base
FROM httpd:2.4

#Etiquetado
LABEL maintainer="victor.castro"
LABEL project="apache-lemoncode"

#Como metadato, indicamos que el contenedor utiliza el puerto 80
EXPOSE 80

#Copiamos el contenido del directorio "content" al directorio donde Apache expone los ficheros html
COPY content/ /usr/local/apache2/htdocs/