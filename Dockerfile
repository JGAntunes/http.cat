FROM node:8-alpine as build
  
WORKDIR /code

COPY . .
RUN npm i &&\
    npm run build &&\
    npm run min

FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/http.cat.conf
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=build /code/dist /www/http.cat
