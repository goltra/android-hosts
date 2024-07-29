*ESPAÑOL*

Utilidad para generar un fichero hosts y pasarlo a un emulador android. También hay un script
que permite arrancar cada emulador instalado con el sistema de ficheros en modo escritura de modo
que los cambios hechos previamente en el host aparezcan. Esto se hace porque a partir del sdk 30
cuando arrancas el emulador sin el sistema de ficheros en modo escritura, los cambios que hubieras hecho 
en el hosts no aparecen.

**IMPORTANTE**

Las imágenes que se usen para crear el emulador no deben tener PLAY STORE. Esas imágenes no 
permiten montar el sistema en modo escritura.

## ¿Como se usa?

- Crea el fichero .env. Debes configurar el fichero .env con la ip donde quieres que apunten los hosts.
Ejemplo: ip=192.168.5.188

- Debes crear el fichero **hosts_template**. En el fichero hosts_template debe añadir las entradas que quieras que tenga el fichero hosts 
donde la ip será la variable {ip}. Ejemplo: 

```
  127.0.0.1       localhost
  ::1             ip6-localhost
  {ip}	host1.local host2.local
```
- Ejecuta el script con el comando './install_hosts_to_emulator.sh'. Recuerda aplicar permisos de ejecución al fichero


*ENGLISH*

Here is the English version of the provided README.md content:

---

Utility to generate a hosts file and transfer it to an Android emulator. There is also a script
that allows you to start each installed emulator with the file system in write mode so that previously made changes to the hosts appear. This is necessary because from SDK 30 onwards, when you start the emulator without the file system in write mode, the changes you made in the hosts do not appear.

**IMPORTANT**

The images used to create the emulator should not have PLAY STORE. These images do not allow mounting the system in write mode.

## How to use?

- Create the .env file. You must configure the .env file with the IP where you want the hosts to point.
  Example: ip=192.168.5.188

- You must create the **hosts_template** file. In the hosts_template file, you should add the entries you want the hosts file to have where the IP will be the {ip} variable. Example:

```
  127.0.0.1       localhost
  ::1             ip6-localhost
  {ip}	host1.local host2.local
```
- Run the script with the command './install_hosts_to_emulator.sh'. Remember to apply execution permissions to the file.
