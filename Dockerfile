FROM buddhi82/webserver:v1

EXPOSE 80

COPY index.html /var/www/html

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
