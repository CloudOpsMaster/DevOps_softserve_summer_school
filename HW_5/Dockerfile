FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean
COPY index.html /var/www/html/index.html
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]

