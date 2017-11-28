FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/http.cat.conf
RUN rm /etc/nginx/conf.d/default.conf
COPY . /www/http.cat
