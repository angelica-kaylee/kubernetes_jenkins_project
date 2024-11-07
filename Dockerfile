# Use a CentOS 7 base image
FROM centos:7

# Set labels for metadata
LABEL maintainer="angelicakaylee88@gmail.com"

# Update repository URLs for CentOS 7 archives
RUN sed -i 's|^mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo

# Install Apache HTTP server and necessary utilities
RUN yum install -y httpd zip unzip && \
    yum clean all

# Set up the working directory for Apache
WORKDIR /var/www/html

# Download the template, rename it to avoid directory conflicts, and unzip it into the Apache root directory
ADD https://templatemo.com/download/templatemo_588_ebook_landing /tmp/templatemo_588_ebook_landing.zip
RUN unzip /tmp/templatemo_588_ebook_landing.zip -d /var/www/html && \
    rm /tmp/templatemo_588_ebook_landing.zip

# Set up Apache to run in the foreground (important for containerization)
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80

