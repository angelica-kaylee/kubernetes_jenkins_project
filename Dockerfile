FROM centos:7
MAINTAINER angelicakaylee88@gmail.com
RUN yum install -y httpd \
 zip\
 unzip
RUN curl -f -o /tmp/mediplus-lite.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip || echo "File download failed"
ADD /tmp/mediplus-lite.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip mediplus-lite.zip
RUN cp -rvf mediplus-lite/* .
RUN rm -rf mediplus-lite mediplus-lite.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
