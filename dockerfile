FROM httpd

COPY ./html5up-editorial-m2i/html5up-editorial /usr/local/apache2/htdocs

RUN apt update -y && apt upgrade -y 
RUN apt install nano -y && apt install git -y

EXPOSE 80