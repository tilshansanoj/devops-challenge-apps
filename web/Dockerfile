#Build Stage
FROM node:20-alpine AS build
COPY package*.json ./
WORKDIR /app
COPY /web .
RUN npm install

WORKDIR /app
EXPOSE 8080

CMD [ "npm", "start" ]