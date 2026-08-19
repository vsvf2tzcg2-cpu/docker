FROM httpd
COPY ./public-html/ /usr/local/apache2/htdocs/

COPY html5up-editorial-m2i/html5up-editorial /usr/local/apache2/htdocs

EXPOSE 80