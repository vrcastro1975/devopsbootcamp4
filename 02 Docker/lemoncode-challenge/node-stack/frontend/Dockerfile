FROM node:18
WORKDIR /usr/src/app
COPY package*.json ./
COPY . .
# RUN npm install
RUN npm ci
RUN npm run build
CMD ["npm", "start"]


# FROM node:18 AS builder
# WORKDIR /opt/build
# COPY . .
# RUN npm ci
# RUN npm run build

# FROM node:18
# WORKDIR /opt/app
# COPY --from=builder /opt/build/dist .
# COPY ./*.json .
# RUN npm ci --only-production
# EXPOSE 8080
# CMD ["node", "app.js"]