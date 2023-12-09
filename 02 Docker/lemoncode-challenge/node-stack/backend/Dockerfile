FROM node:18 AS builder
WORKDIR /opt/build
COPY . .
RUN npm ci
RUN npm run build

FROM node:18
WORKDIR /opt/app
COPY --from=builder /opt/build/dist .
COPY ./*.json .
RUN npm ci --only-production
EXPOSE 5000
CMD ["node", "app.js"]