#DESCARGAMOS (PULL) DE CENTOS 7
FROM centos:7

# INSTALA SSH EN CENTOS
RUN yum -y install openssh-server

# CREAMOS UN USUARIO Y CONTRASEÑA
RUN useradd remote_user && \
    # LA CONTRASEÑA ES 1234
    echo "1234" | passwd remote_user  --stdin && \
    #CREAMOS UN DIRECTORIO Y PERMISOS
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

#ANTES DE ESTE PASO SERÁ NECESARIO CREAR UNA KEY (ssh-keygeb -f remote-key)
#UNA VEZ EJECUTADO EL PASO ANTERIOR SE CREAN DOS FICHEROS
#- remote-key 
#- remote-key.pub
#ESTE ULTIMO TENDRÉMOS QUE COMPARTIRLO CON LA MÁQUINA REMOTA PARA CONECTARSE

#SE COPIA EL FICHERO .PUB A LA CARPETA /home/remote_user/.ssh/authorized_keys
COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

#CAMBIAMOS EL PROPIETARIO (ROOT) AL USUARIO remote_user DE FORMA RECURSIVA
RUN chown remote_user:remote_user   -R /home/remote_user && \
    #CAMBIAMOS LOS PERMISOS DE LA CARPETA
    chmod 400 /home/remote_user/.ssh/authorized_keys

#SE EJECUTA ESTA LÍNEA LA PRIMERA VEZ QUE SE PROVISIONA UN SSH
#AL SER CONTENERIZADO ES NECESARIO, NO OCURRE SI NO LO ES.
RUN ssh-keygen -A

RUN yum -y install mysql

RUN yum -y install epel-release && \
    yum -y install python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install awscli

#EJECUTAMOS EL SERVICIO DE SSHD CON SIGUIENTE COMNADO, QUE ES 
CMD /usr/sbin/sshd -D
