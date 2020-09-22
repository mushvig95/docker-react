#BUILD PHASE
FROM node:alpine

WORKDIR '/app'

COPY package.json ./
RUN npm i

COPY ./ ./
RUN npm run build

#RUN PHASE
FROM nginx

#Solely for elasticbeanstalk
EXPOSE 3000
COPY --from=0 /app/build /usr/share/nginx/html 