FROM centos:7
MAINTAINER angelicakaylee88@gmail.com
RUN yum install -y httpd \
 zip\
 unzip
ADD https://templatemo.com/download/templatemo_588_ebook_landing /var/www/html/
WORKDIR /var/www/html/
RUN unzip templatemo_588_ebook_landing.zip
RUN cp -rvf templatemo_588_ebook_landing/* .
RUN rm -rf templatemo_588_ebook_landing templatemo_588_ebook_landing.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
