#!/bin/bash

# Starts ssh
#ARRANCA EL PROCESO DE SSH
/usr/sbin/sshd

# Starts php process in background

/usr/sbin/php-fpm -c /etc/php/fpm

# Starts nginx daemon

nginx -g 'daemon off;'


