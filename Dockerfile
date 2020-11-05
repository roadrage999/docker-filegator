FROM debian:stable

RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list

RUN set -ex; \
    apt update; \
    apt install -y \
      wget \
          unzip \
          php \
          apache2 \
          libapache2-mod-php \
          php-zip \
&& apt upgrade -y \
&& apt -q -y clean \
&& apt autoclean -y

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN cd /var/www/ \
&& wget https://github.com/filegator/static/raw/master/builds/filegator_v7.4.6.zip \
&& unzip filegator_v7.4.6.zip && rm filegator_v7.4.6.zip \
&& chown -R www-data:www-data filegator/ \
&& chmod -R 775 filegator/

COPY filegator.conf /etc/apache2/sites-available/filegator.conf
COPY servername.conf /etc/apache2/conf-available/
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN a2dissite 000-default.conf \
&& a2ensite filegator.conf

EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
