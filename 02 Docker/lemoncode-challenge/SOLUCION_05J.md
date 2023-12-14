docker network create lemoncode

docker run -d --name mongosv \
  --network lemoncode \
  mongo:4

docker run -d -p 5000:5000 --name backend \
  --network lemoncode \
  -e DATABASE_URL="mongodb://mongosv:27017" \
  backend-image