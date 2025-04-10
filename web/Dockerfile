#Build Stage
FROM node:20-alpine AS build
WORKDIR /app
COPY /web .
RUN npm install

#Run stage
FROM node:20-alpine AS run
ENV NODE_ENV=production

RUN addgroup -g 1001 -S user_group
RUN adduser -S user -u 1001

WORKDIR /app

COPY --chown=user:user_group . .
COPY --from=build --chown=user:user_group /app/node_modules ./node_modules
COPY --from=build --chown=user:user_group /app/package.json ./package.json
COPY --from=build --chown=user:user_group /app/bin ./bin
COPY --from=build --chown=user:user_group /app/package-lock.json ./package-lock.json
COPY --from=build --chown=user:user_group /app/app.js ./app.js

EXPOSE 8080

CMD [ "npm", "start" ]