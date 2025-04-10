#Build Stage
FROM node:20-alpine AS build
WORKDIR /app
COPY /web .
RUN npm install
RUN npm run build

EXPOSE 8080

CMD [ "npm", "start" ]