FROM jenkins/jenkins

#NOS CAMBIAMOS A ROOT PARA INSTALAR PIP
USER root

#INSTALAMOS PIP Y ANSIBLE
RUN apt-get update && apt-get install python3-pip -y && \
    pip3 install ansible --upgrade

#VOLVEMOS A CAMBIAR DE USUARIO A JENKINS
USER jenkins