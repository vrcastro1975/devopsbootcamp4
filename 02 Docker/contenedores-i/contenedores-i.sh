# Día I: Introducción a Docker #

#### Cómo instalar Docker Engine ###

#Si estás en Windows o Mac: Revisar Docker Desktop:
https://docs.docker.com/docker-for-windows/
https://docs.docker.com/docker-for-mac/    

#Si trabajas con Linux elige tu distro aquí
https://docs.docker.com/engine/install/

# Una vez que tienes Docker instalado en tu máquina...

#Ver información del cliente y el servidor que forman Docker Engine.
docker version

#Por defecto se asume que se utilizarán contenedores Linux ( OS/Arch:  linux/amd64 en el apartado de Server).
docker info

#Si estás en Windows puedes cambiar al tipo de contenedores Windows haciendo click con el botón derecho sobre el icono de Docker en la barra de tareas y eligiendo Switch to Windows Containers
cd c:\Program Files\Docker\Docker> .\dockercli -SwitchDaemon 

#### Ejecuta tu primer contenedor ####

#Ejecuta tu primer contenedor
docker run hello-world
#hello-world es la imagen que estás usando para crear tu contenedor. Una imagen es un objeto que contiene un SO, una aplicación y las dependencias que esta necesita. Si eres desarrollador puedes pensar en una imagen como si fuera una clase.

#Lista las imágenes que tienes descargadas en tu local
docker image ls
# O bien
docker images

#¿Y estas imágenes de dónde vienen? 
#De Docker Hub :-) https://hub.docker.com/
#O bien a través del CLI
docker search nginx

#Podemos ejecutar otros contenedores con algo más de funcionalidad que el simple hello-world
docker run nginx

#### Exponer puertos en localhost (Nginx) ####
docker run --publish 8080:80 nginx #Puedes ver cuando se ejecuta este comando que el terminal te muestra los logs que van surgiendo de este contenedor que acabas de crear.
#Normalmente, por acortar en lugar de publish utilizamos -p
docker run -p 8080:80 nginx

#Ejecutar un contenedor en segundo plano
docker run --detach -p 8080:80 nginx
#o
docker run -d -p 8080:80 nginx

#Después de haber lanzado varios contenedores te preguntarás ¿cómo puedo ver los que tengo ahora mismo ejecutándose?
docker ps

#Pero... yo he lanzado muchos más ¿dónde están?
docker ps --all
#o bien
docker ps -a

#En todos los ejemplos anteriores, Docker ha elegido un nombre aleatorio para nuestros contenedores (columna NAMES). 
#Sin embargo, muchas veces es útil poder elegir nosotros el nombre que queremos.
#Para elegir el nombre de tu contenedor basta con utilizar la opción --name
docker run -d --name my-web -p 9090:80 nginx

#Si vuelves a listar los contenedores verás que tienes uno nuevo llamado my-web
docker ps

#También puedes renombrar existentes
docker rename NOMBRE_ASIGNADO_POR_DOCKER hello-world
docker ps -a

#Ejecutar un contenedor y lanzar un shell interactivo en él
docker run --interactive --tty ubuntu /bin/bash
#o
docker run -it ubuntu /bin/bash
#Revisa la versión del SO que está instalado en tu contenedor
cat /etc/os-release
exit

#Si quiero conectarme a un contenedor
docker run --name webserver -d nginx  #Con -d desatacho
docker exec -it webserver bash #Ejecuto el proceso bash dentro del contenedor y con -it me atacho a él
cat /etc/nginx/nginx.conf 
exit

# Ejecutar comandos desde mi local dentro del contenedor ####
docker exec my-web ls /var/log/nginx

## Copiar un archivo desde mi local a dentro del contenedor ####
#https://docs.docker.com/engine/reference/commandline/cp/
docker cp local.html my-web:/usr/share/nginx/html/local.html

## Copiar el archivo de logs en local ####
docker cp my-web:/var/log/nginx/access.log access.log

## Copiar múltiples archivos dentro de una carpeta ####
mkdir nginx-logs
docker cp my-web:/var/log/nginx/. nginx-logs

# ¿Cómo paro un contenedor?
docker stop my-web

    # ¿Y si quiero volver a iniciarlo?
    docker start my-web

#¿Y si quiero eliminarlo del todo de mi ordenador?
docker stop my-web
docker rm my-web
docker ps -a #El contenedor hello-world ya no aparece en el listado

#Todo esto también es posible verlo desde la interfaz de Docker Desktop (A través de la opción Dashboard)

## SQL Server dockerizado ####
# Imagínate que estás desarrollando una aplicación que necesita de un SQL Server y no quieres tener que montarte uno y ensuciar tu máquina, o tener que crearte una máquina virtual, configurarla, bla, bla, bla
# https://hub.docker.com/_/microsoft-mssql-server
docker run --name mysqlserver -p 1433:1433 -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Lem0nCode!' -d mcr.microsoft.com/mssql/server:2019-latest 

#También puedes utilizar sqlcmd para conectarte con tu instancia
docker exec -it mysqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Lem0nCode! #### -it No quiero que el terminal se quede "esperando" al contenedor ####

#Crea una base de datos
CREATE DATABASE Lemoncode;
GO

#Selecciona la base de datos
USE Lemoncode;
GO

#Crea una tabla
CREATE TABLE Courses(ID int, Name varchar(max), Fecha DATE);
GO

#Insertar registros en la tabla
SET LANGUAGE ENGLISH;
GO
INSERT INTO Courses VALUES (1, 'Bootcamp DevOps', '2020-10-5'), (2,'Máster Frontend','2020-09-25');
GO

#Ahora conectate con Azure Data Studio a tu localhost:1433 y tendrás tu acceso a tu SQL Server dockerizado!

#Una vez que termines, ya puedes parar y eliminar tu SQL Server dockerizado
exit
docker stop mysqlserver && docker rm mysqlserver
#también puedes pararlo y eliminarlo de golpe
docker rm -f mysqlserver


#### Bonus track: Eliminar todos los contenedores e imágenes de local ####

#Listar todos los IDs de todos los contenedores
docker ps --help
docker ps -aq

#Parar todos los contenedores 
docker stop $(docker ps -aq)
docker ps

#Eliminar todos los contenedores
docker rm $(docker ps -aq)