Utilidad para generar un fichero hosts y pasarlo a un emulador android.

**IMPORTANTE**

Las imágenes que se usen para crear el emulador no deben tener PLAY STORE. Esas imágenes no 
permiten montar el sistema en modo escritura.

## ¿Como se usa?

- Debes configurar el fichero .env con la ip donde quieres que apunten los hosts.

- En el fichero hosts_template debe añadir las entradas que quieras que tenga el fichero hosts 
donde la ip será la variable {ip}. 

```
  127.0.0.1       localhost
  ::1             ip6-localhost
  {ip}	host1.local host2.local
```
- Ejecuta el script con el comando './install_hosts_to_emulator.sh'. Recuerda aplicar permisos de ejecución al fichero

