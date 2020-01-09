FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf
COPY docker/conf/upload.conf /etc/nginx/conf.d/