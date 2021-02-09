#Para AWS no se puede usar un alias
#PAso 1 
#FROM node:alpine as builder
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#PAso 2 
#/app/build --> all the stuff 
#COPY --from="name" "folder" "to"
#Expose -> elasticbeanstalk map external port to 80
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
#COPY --from=builder /app/build /usr/share/nginx/html



