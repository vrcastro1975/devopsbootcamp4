## EJERCICIO 1 (TODO A MANO)
## -------------------------

# Tanto para el backend como para el frontend, voy a usar "node-stack" en lugar de "dotnet-stack"

# ANTES DE NADA: Si trabajo con Linux, como es mi caso, tengo que hacer una modificación en el
# fichero "node-stack/backend/src/config.ts" ya que no funcionará si no se hace:
# En el apartado "export default/app" hay que cambiar esto:
# host: process.env.HOST || 'localhost',
# por esto otro:
# host: process.env.HOST || '0.0.0.0',

# Además de eso, edito el fichero ".env.local" y lo adapto: (esto es cosa de la aplicación)
# .env.local:
# -----------
# DATABASE_URL=mongodb://some-mongo:27017
# DATABASE_NAME=TopicstoreDb
# HOST=localhost
# PORT=5000

# El directorio de trabajo del ejercicio va a ser "node-stack"
# Quedando, por tanto dos subdirectorios: "frontend" y "backend".
# Creo la red "lemoncode-challenge"
docker network create lemoncode-challenge

## MONGODB + BACKEND
## -----------------

# Creo el contenedor "some-mongo" para que el backend pueda comunicarse con el mongodb, y su correspondiente
# volumen "mongodata", que se mapeará a "/data/db".
docker run -d \
--name some-mongo \
--network lemoncode-challenge \
--mount source=mongodata,target=/data/db \
# -p 27017:27017 \
# -e MONGO_INITDB_ROOT_USERNAME:root \
# -e MONGO_INITDB_ROOT_PASSWORD:secret \
mongo:4

# Genero la imagen "backend-image" a partir de este dockerfile que está en el directorio "backend" para construir
# posteriormente el contenedor del backend, que debe llamarse "topics-api" por exigencias del enunciado.
  # Dockerfile:
  # -----------
  # FROM node:18 AS builder
  # WORKDIR /opt/build
  # COPY . .
  # RUN npm ci
  # RUN npm run build
  #
  # FROM node:18
  # WORKDIR /opt/app
  # COPY --from=builder /opt/build/dist .
  # COPY ./*.json .
  # RUN npm ci --only-production
  # EXPOSE 5000
  # CMD ["node", "app.js"]
cd backend
docker build -t backend-image .
cd ..

# Ahora creo el contenedor "topics-api" (backend) a partir de la imagen "backend-image" que he creado en el paso anterior
# para que el backend pueda comunicarse con el frontend.
docker run -d -p 5000:5000 --name topics-api \
  --network lemoncode-challenge \
  -e DATABASE_URL="mongodb://some-mongo:27017" \
  backend-image

# Ya debería tener los contenedores "some-mongo" y "backend" creados. Lo comprobamos:
docker container ls

# Ahora comprobamos con curl:
curl -v http://localhost:5000/api/topics
# Y devuelve [], con lo que parece que la cosa va bien (sale vacío porque nosotros no hemos almacenado aún ningún topic).
# Vamos a probar a almacenar algún topic. Si nos vamos al "README.md" del backend, podemos ver esto:
#
# If you want to feed some data you can try:
## ```bash
# curl -d '{"Name":"Devops"}' -H "Content-Type: application/json" -X POST http://localhost:5000/api/topics
# curl -d '{"Name":"K8s"}' -H "Content-Type: application/json" -X POST http://localhost:5000/api/topics
# curl -d '{"Name":"Docker"}' -H "Content-Type: application/json" -X POST http://localhost:5000/api/topics
# curl -d '{"Name":"Prometheus"}' -H "Content-Type: application/json" -X POST http://localhost:5000/api/topics
# ```
# Vamos, por ejemplo, a almacenar el primero:
# curl -d '{"Name":"Devops"}' -H "Content-Type: application/json" -X POST http://localhost:5000/api/topics
# Y si ahora volvemos a ejecutar el comando anterior, veremos que ya tenemos el primer topic:
curl -v http://localhost:5000/api/topics
*Connection #0 to host localhost ..... <- Comprobar esto



## Frontend
## --------
# Genero la imagen "frontend-image" a partir de este dockerfile que está en el directorio "frontend" para construir
# posteriormente el contenedor del frontend, que vamos a llamar simplemente "frontend" ya que esta vez el enunciado
# no nos exige ningún nombre para él. Eso sí, se nos dice que debe estar mapeado con el host para ser accesible a
# través del puerto 8080.
  # Dockerfile:
  # -----------
  # FROM node:18 AS builder
  # WORKDIR /opt/build
  # COPY . .
  # RUN npm ci
  # RUN npm run build
  #
  # FROM node:18
  # WORKDIR /opt/app
  # COPY --from=builder /opt/build/dist .
  # COPY ./*.json .
  # RUN npm ci --only-production
  # EXPOSE 8080
  # CMD ["node", "app.js"]
cd frontend
docker build -t frontend-image .
cd ..

# Ahora creo el contenedor "frontend" (frontend) a partir de la imagen "frontend-image" que he creado en el paso anterior
# para que el frontend sea accesible desde el puerto 8080 de nuestro localhost.
docker run -d -p 8080:8080 --name frontend \
  --network lemoncode-challenge \
  frontend-image

# Y si ahora abrimos un navegador y nos vamos a http://localhost:8080, deberíamos ver la aplicación


## EJERCICIO 2 (TODO AUTOMATIZADO CON DOCKER COMPOSE)
## --------------------------------------------------

# Para hacer todo lo anterior con "docker compose", deberíamos tener los dockerfiles anteriores en las
# mismas ubicaciones (directorios "frontend" y "backend") y, además, deberíamos tener el fichero
# "compose.yaml" (o "docker-compose.yml" en versiones antiguas) en la raíz de nuestro directorio de
# trabajo, que dijimos que iba a ser "node-stack".
# El contenido de este fichero "compose.yaml" sería el siguiente:

 # compose.yaml:
 # -------------
 # version: '3.9'
 # services:
 #
 ## mongodb
 # some-mongo:
 #   image: mongo:4
 #   volumes:
 #     - mongodata:/data/db
 #   networks:
 #     - lemoncode-challenge
 #
 ## backend
 # topics-api:
 #   build: ./backend
 #   depends_on:
 #     - some-mongo
 #   ports:
 #     - "5000:5000"
 #   environment:
 #     - DATABASE_URL=mongodb://some-mongo:27017
 #   networks:
 #     - lemoncode-challenge
 #
 ## frontend
 # frontend:
 #   build: ./frontend
 #   depends_on:
 #     - topics-api  
 #   ports:
 #     - "8080:8080"
 #   environment:
 #     - API_URL=http://backend:5000/api/topics
 #   networks:
 #     - lemoncode-challenge
 #
 # volumes:
 #   mongodata: 
 #
 # networks:
 #   lemoncode-challenge:

# Ahora, para ejecutarlo todo:
docker compose up

# Y para pararlo todo:
docker compose down
