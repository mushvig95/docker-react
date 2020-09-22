#BUILD PHASE
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm i

COPY . .
RUN npm run build

#RUN PHASE
FROM nginx

#Solely for elasticbeanstalk
EXPOSE 3000
COPY --from=builder /app/build /usr/share/nginx/html 