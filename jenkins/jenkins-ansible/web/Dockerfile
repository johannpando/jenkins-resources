#PARTIMOS DE UNA IMAGEN QUE YA TENEMOS CREADA CON ANTERIORIDAD
#ESTA IMAGEN ES LA DE UN CENTOS 7 CON SSH INSTALADO
FROM remote-host

#SE COPIA FICHERO DE CONFIGURACIÓN DE NGINX A LA CARPETA DE REPOSITORIOS DE LINUX
COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN                                                                          \
  #INSTALA NGINX
  yum -y install nginx-1.12.2 openssl --enablerepo=nginx                  && \
  #INSTALACIÓN DE PHP DEL REPOSITORIO IUS
  yum -y install https://repo.ius.io/ius-release-el7.rpm                  && \
  yum -y install                                                             \
    php71u-fpm                                                               \
    php71u-cli                                                               \
    php71u-mysqlnd                                                           \
    php71u-soap                                                              \
    php71u-xml                                                               \
    php71u-zip                                                               \
    php71u-json                                                              \
    php71u-mcrypt                                                            \
    php71u-mbstring                                                          \
    php71u-zip                                                               \
    php71u-gd                                                                \
     --enablerepo=ius-archive && yum clean all

EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm


COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

#COPIA EL FICHERO START
COPY ./bin/start.sh /start.sh
#SE OTORGA PERMISOS AL SCRIPT
RUN chmod +x /start.sh
#SE EJECUTA PROCESO (INICIA SSH, PHP Y NGINX)
CMD /start.sh

