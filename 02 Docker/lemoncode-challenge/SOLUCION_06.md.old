## EJERCICIO 1 (TODO A MANO)
## -------------------------

# Tanto para el backend como para el frontend, voy a usar "node-stack" en lugar de "dotnet-stack"

# ANTES DE NADA: Si trabajo con Linux, como es mi caso, tengo que hacer una modificación en el
# fichero "node-stack/backend/src/config.ts" ya que no funcionará si no se hace:
# En el apartado "export default/app" hay que poner esto:
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
curl localhost:5000/api/topics
# Y devuelve [], con lo que parece que va bien

## Frontend
## --------



