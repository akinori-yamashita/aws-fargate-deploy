FROM nginx:alpine
 
COPY ./docker/nginx/conf/default.conf /etc/nginx/conf.d/
ADD ./docker/nginx/conf/nginx.conf /etc/nginx/
COPY ./docker/sites/index.html /var/www/html/
 
EXPOSE 80
