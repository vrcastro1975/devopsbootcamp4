#Deberes:
#1. Crea un contenedor que cree un volumen llamado images y que utilice la imagen 0gis0/galleryapp
#1.1 El volume debe estar montado en la carpeta images del WORKDIR del contenedor 
docker run  -p 9000:8080 --mount source=images,target=/usr/src/app/images galleryapp

Esa imagen no existe. En su lugar, he tenido que usar yazcunaga/galleryapp:
docker run  -p 9000:8080 --mount source=images,target=/usr/src/app/images yazcunaga/galleryapp
Unable to find image 'yazcunaga/galleryapp:latest' locally
latest: Pulling from yazcunaga/galleryapp
213ec9aee27d: Pull complete 
9bbf040c9c7e: Pull complete 
bdc748662e87: Pull complete 
1bc265bd9f07: Pull complete 
524dffd32d08: Pull complete 
bd1b6e241a5e: Pull complete 
a0fe9bafa218: Pull complete 
762b6e4920ab: Pull complete 
9cec783a05e7: Pull complete 
Digest: sha256:e6f3cfc5b058d22b8e0c97f2c903d17d4946f4bd342bd83b7051e036c0bc13c0
Status: Downloaded newer image for yazcunaga/galleryapp:latest

> gallery-app@1.0.0 start /usr/src/app
> node server.js

Server running at http://127.0.0.1:8080/

#Puedes copiar las imagenes con este comando
docker cp /Users/gis/Pics/. zen_perlman:/usr/src/app/images

Abrimos otro terminal y miramos cómo se llama el nuevo contenedor:
docker container ls
CONTAINER ID   IMAGE                  COMMAND                  CREATED          STATUS          PORTS                                       NAMES
606bd70e4ac0   yazcunaga/galleryapp   "docker-entrypoint.s…"   11 minutes ago   Up 11 minutes   0.0.0.0:9000->8080/tcp, :::9000->8080/tcp   reverent_torvalds

Y copiamos algunas ficheros en él:

Para copiar los ficheros:

docker cp ~/files/. reverent_torvalds:/usr/src/app/images
Successfully copied 24.1kB to reverent_torvalds:/usr/src/app/images


# 2. Elimina el contenedor anterior y comprueba que tu volumen sigue estando disponible.
docker rm -f CONTAINER_NAME

En mi caso:
docker rm -f reverent_torvalds
reverent_torvalds

docker container ls
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

#Puedes ver que el volumen sigue estando disponible con este comando
docker volume ls

En mi caso:
docker volume ls
DRIVER    VOLUME NAME
local     images

# O a través del apartado Docker de Visual Studio Code
#Puedes ver el contenido del volumen creando otro contenedor o usando la opción *Explore in Development Container*

# 3. Mapea una carpeta local a un contenedor. Cambia el contenido de dicha carpeta y comprueba que ves los cambios dentro del contenedor.
docker run  -p 9000:8080 --mount type=bind,source=/Users/gis/Pics,target=/usr/src/app/images galleryapp

En mi caso:
docker run  -p 9000:8080 --mount type=bind,source=/home/victor/files,target=/usr/src/app/images yazcunaga/galleryapp

El terminal se queda bloqueado. Ahora, en el navegador de internet, nos vamos a localhost:9000 y vemos nuestra aplicación funcionando.
Si nos vamos a otro terminal, o al administrador de ficheros del sistema, navegamos a la carpeta que hemos mapeado y borramos una de las
imágenes, vemos que desaparece de la aplicación que hemos contenerizado (recargando la página, claro).

Para terminar, borramos todo para dejar nuestro equipo limpio:
docker container kill musing_dewdney
musing_dewdney

docker volume prune 
WARNING! This will remove anonymous local volumes not used by at least one container.
Are you sure you want to continue? [y/N] y
Total reclaimed space: 0B

(no lo borra)

docker volume ls
DRIVER    VOLUME NAME
local     images

docker volume rm images
images

docker volume ls
DRIVER    VOLUME NAME

(ahora sí)