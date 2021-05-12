*********** Vagrant - Algunos comandos **************
Para levantar una VM
vagrant up

Conectar a la MV
vagrant ssh

Detener la MV
vagrant destroy

Para reiniciar Vagrant
vagrant reload

Detener y guardar el estado actual de la MV
vagrant suspend

Apagar MV
vagrant halt

Eliminar todos los rastros (libera los recursos utilizados por Vagrant)
vagrant destroy

Ejecutar
vagrant up --provision

*********** Vagrant - Boxes *****************

Las encontramos en: 
c:\Users\[nombre-usuario]\.vagrant.d\

*********** Vagrant - Error codificación ******** 
Para Usuarios Windows :( (Ha Vagrant no le gusta la codificación de windows)
Si tenemos error index negativo o nulo eliminar los archivos index del siguiente folder

c:\Users\[nombre-usuario]\.vagrant.d\data\machine-index\

Otra posible solución (Forzar la codificación)
Replace directory: box.directory.sub(Vagrant.user_data_path.to_s + "/", "") with directory: box.directory.sub(Vagrant.user_data_path.to_s.force_encoding("windows-1251") + "/", "") in file <VagrantFolder>\embedded\gems\2.2.3\gems\vagrant-2.2.3\plugins\commands\up\middleware\store_box_metadata.rb.

