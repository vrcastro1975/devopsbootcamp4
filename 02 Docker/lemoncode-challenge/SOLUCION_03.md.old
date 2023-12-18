Bootcamp Devops IV - Laboratorio Módulo 2
Contenedores Docker
Laboratorio Contenedores Docker

Ejercicio 1
===========
Dockeriza la aplicación dentro de lemoncode-challenge, la cual está compuesta de 3 partes:

-Un front-end con Node.js
-Un backend en .NET ( dotnet-stack ) o en Node.js ( node-stack ) que utiliza un MongoDB para almacenar la información.
-El MongoDB donde se almacena la información en una base de datos.

Nota: como has podido comprobar, el directorio lemoncode-challenge tiene dos carpetas:
    dotnet-stack
    node-stack

En ambos casos el frontend es el mismo, sólo cambia el backend. Usa el stack que prefieras.

Requisitos del ejercicio:
1. Los tres componentes deben estar en una red llamada lemoncode-challenge.
2. El backend debe comunicarse con el mongodb a través de esta URL mongodb://some-mongo:27017.
3. El front-end debe comunicarse con la api a través de http://topics-api:5000/api/topics.
4. El front-end debe estar mapeado con el host para ser accesible a través del puerto 8080.
5. El MongoDB debe almacenar la información que va generando en un volumen, mapeado a la ruta /data/db.
6. Este debe de tener una base de datos llamada TopicstoreDb con una colección llamada Topics. La colección Topics debe tener esta estructura:
    {
    "_id": { "$oid" : "5fa2ca6abe7a379ec4234883" },
    "Name" : "Contenedores"
    }

¡Añade varios registros!

Tip para backend:
Antes de intentar contenerizar y llevar a cabo todos los pasos del ejercicio se recomienda intentar ejecutar la aplicación sin hacer cambios
en ella. En este caso, lo único que es posible que “no tengamos a mano” es el MongoDB. Por lo que empieza por crear éste en Docker. Usa un
cliente como el que vimos en el primer día de clase (MongoDB Compass) para añadir datos que pueda devolver la API.

Nota: es más fácil si abres Visual Studio Code desde la carpeta backend para hacer las pruebas y las modificaciones que si te abres desde la
raíz del repo. Para ejecutar este código sólo debes lanzar dotnet run si usas el stack de .NET, o npm install && npm start si usas el stack
de Node.js.

Tip para frontend:
Para ejecutar el frontend abre esta carpeta en VS Code y ejecuta primero npm install. Una vez instaladas las dependencias, ya puedes ejecutarla
con npm start. Debería de abrirse un navegador con lo siguiente:
    Topics
    Contenedores

Ejercicio 2
===========
Ahora que ya tienes la aplicación del ejercicio 1 dockerizada, utiliza Docker Compose para lanzar todas las piezas a través de éste. Debes
plasmar todo lo necesario para que ésta funcione como se espera: la red que utilizan, el volumen que necesita MongoDB, las variables de entorno,
el puerto que expone la web y la API. Además, debes indicar qué comandos utilizarías para levantar el entorno, pararlo y eliminarlo.

--------------------

Ejercicio 1:
------------
Para ambos ejercicios opto por usar Node en lugar de dotnet, por lo cual,e stablezco mi directorio de trabajo en "node-stack", teniendo como subdirectorios por tanto a "backend" y a "frontend". La estructura de directorios quedaría así:
- node-stack
  - backend
    - Dockerfile
    - (...)
  - frontend
    - Dockerfile
    - (...)

Lo primero que voy a hacer es crear la red "lemoncode-challenge". Para ello:
[bash]:
docker network create lemoncode-challenge --driver=bridge

Ahora hago el Dockerfile del backend:
[backend/Dockerfile]:
FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]

Construyo la imagen y ejecuto el contenedor de backend (en un primer terminal):
[bash]:
docker build -t backend-image ./backend
docker run --network=lemoncode-challenge --name=backend-container -e MONGO_URL=mongodb://some-mongo:27017 backend-image

Ahora hago el Dockerfile del frontend:
[/frontend/Dockerfile]:
FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]

Construyo la imagen y ejecuto el contenedor de frontend (en un segundo terminal):
[bash]
docker build -t frontend-image ./frontend
docker run --network=lemoncode-challenge --name=frontend-container -p 8080:5000 -e API_URL=http://topics-api:5000/api/topics frontend-image

Y ahora dockerizo MongoDB (en un tercer terminal):
[bash]
docker run --network=lemoncode-challenge --name=mongodb-container -v mongodata:/data/db -e DATABASE_URL=mongodb://localhost:27017 -e DATABASE_NAME=TopicstoreDb -e HOST=localhost -e PORT=5000 -d mongo

Una vez que tengo todo funcionando, me voy a un terminal y escribo:
http://localhost:


Ejercicio 2:
------------
Lo mismo, pero usando docker compose:

[Estructura de directorios]:
- node-stack
  - compose.yaml
  - backend
    - Dockerfile
    - (...)
  - frontend
    - Dockerfile
    - (...)

Hago el Dockerfile del backend:
[backend/Dockerfile]:
FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]

Hago el Dockerfile del frontend:
[/frontend/Dockerfile]:
FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]

Hago el compose.yaml:
[compose.yaml]:
version: '3.8'
services:
  backend:
    build: ./backend
    networks:
      - lemoncode-challenge
    depends_on:
      - mongodb
    environment:
      - MONGO_URL=mongodb://some-mongo:27017

  frontend:
    build: ./frontend
    networks:
      - lemoncode-challenge
    ports:
      - "8080:5000"
    environment:
      - API_URL=http://topics-api:5000/api/topics

  mongodb:
    image: mongo
    networks:
      - lemoncode-challenge
    volumes:
      - /data/db
    command: mongod
    environment:
      - DATABASE_URL=mongodb://localhost:27017
      - DATABASE_NAME=TopicstoreDb
      - HOST=localhost
      - PORT=5000
      - MONGO_INITDB_ROOT_USERNAME: root
      - MONGO_INITDB_ROOT_PASSWORD: example
      - MONGO_INITDB_DATABASE=TopicstoreDb

networks:
  lemoncode-challenge:


Ahora levanto el docker compose:
[bash]:
docker compose up --build -d

Para pararlos:
[bash]:
docker compose down