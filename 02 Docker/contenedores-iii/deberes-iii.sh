#Deberes: 
cd contenedores-iii
# 1. Dockeriza la aplicación de la carpeta hello-lemoncoder con Visual Studio Code

#Antes de dockerizar la aplicación es recomendable comprobar antes si esta funciona, por no volvernos locos.
cd hello-lemoncoder
npm install
npm start

#Una vez comprobado, utiliza Comand + P (Mac) o Control + P (Windows) y busca lo siguiente:
# > Add Docker Files to Workspace > Node.js > selecciona el package.json de la lista y el puerto es el 3000
# Esto debería de generar el archivo Dockerfile dentro de hello-lemoncoder
#O bien seleccionando el archivo Dockerfile con el botón derecho y hacer clic en Build Image...


# He tenido que instalar antes la extensión "Docker" de Microsoft en Visual Studio Code.
# Una vez hecho esto, he seguido las instrucciones y he podido crear la imagen sin problema
# Haciendo un "docker image ls" obtengo:
# REPOSITORY        TAG       IMAGE ID       CREATED              SIZE
# hellolemoncoder   latest    2c703766a3ea   About a minute ago   186MB


# 2. Ejecutar un contenedor con tu nueva imagen usando Visual Studio Code

# Para ejecutar un contenedor con la nueva imagen "hellolemoncoder", procedo de la siguiente manera:
# docker run --name hellolemoncoder -p4000:3000 hellolemoncoder
# Y obtengo lo siguiente:

# > hello-lemoncoder@1.0.0 start
# > node server.js

# Example app listening on port 4000!


