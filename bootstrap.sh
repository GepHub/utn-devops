#!/usr/bin/env bash

#actualizamos los paquetes de ubuntu
apt-get update

#instalo monitor de recursos
apt-get install -y nmon

#instalamos apache requerido por actividad
sudo apt-get install -y apache2

#instalo git en ubuntu
sudo apt-get install -y git-all

#ruta servidor web
APACHE_ROOT="/var/www"

#ruta de la aplicación
APP_PATH="$APACHE_ROOT/utn-devops-app"

#configuración servidor web
#copio el archivo de configuración del repositorio en la configuración del servidor web
if [ -f "/tmp/devops.site.conf" ]; then
	echo "Configuración apache"
	sudo mv /tmp/devops.site.conf /etc/apache2/sites-available
	#activo el nuevo sitio web
	sudo a2ensite devops.site.conf
	#desactivo el default
	sudo a2dissite 000-default.conf
	#refresco el servicio del servidor web para que tome la nueva configuración
	sudo service apache2 reload
fi
	
#aplicación
#descargo la app del repositorio
if [ ! -d "$APP_PATH" ]; then
	echo "Clonar repo"
	cd $APACHE_ROOT
	sudo git clone https://github.com/GepHub/utn-devops-app.git
	cd $APP_PATH
	sudo git checkout unidad-1
fi