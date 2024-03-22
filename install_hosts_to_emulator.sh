# Comprobamos si hay algún emulador arrancado
arrancado=$(adb devices | sed -n '2 p' | grep device | wc -l)

# No podemos ejecutar los comando si ya está arrancado
if [ $arrancado -eq 1 ]
then
  echo '=> ERROR: *** Ya hay un emulador arrancado. ***
Para poder ejecutar este script es necesario que no haya ningún emulador arrancado.'
  exit 1
fi

# Listamos los emuladores disponibles y pedimos al usuario que seleccione uno
emuladores=$(emulator -list-avds)
echo "Emuladores disponibles:\n"
i=1
for emulador in $emuladores
do
  echo "$i) $emulador"
  i=$((i+1))
done
echo "-----------------------\n"

echo "Seleccione el emulador:"
read opcion
device=$(echo $emuladores | awk -v opcion=$opcion '{print $opcion}')
echo "Emulador seleccionado: $device"

# Comprobamos que se ha elegido un emulador
if [ -z "$device" ]
then
  echo "=> ERROR: *** Debe elegir un emulador. ***"
  exit 1
fi

# Arrancamos el emulador
echo '=> Arrancando el emulador'
emulator -avd $device -writable-system -no-snapshot &

# Esperamos a que el emulador arranque
while [ $arrancado -lt 1 ]
do
  echo '=> Esperando a que el emulador arranque'
  sleep 10
  arrancado=$(adb devices | sed -n '2 p' | grep device | wc -l)
done

# Mostramos el contenido actual del fichero hosts del emulador
echo '=> Contenido actual del fichero hosts en el emulador'
adb shell cat /system/etc/hosts

# Obtenemos la ip del fichero .env y generamos el archivo hosts
ip=$(grep ip .env | cut -d '=' -f2)
echo '=> Ip obtenida del fichero .env: ' $ip
echo '=> Generando el archivo hosts'
sed "s/{ip}/$ip/g" hosts_template > hosts
echo "" >> hosts # Añadimos un salto de línea al final del archivo

# Montamos el sistema de archivos en modo lectura/escritura y copiamos el archivo hosts
emulator_name=$(adb devices | sed -n '2 p' | awk '{print $1}')
echo '=> Emulador arrancado ' + $emulator_name
echo '=> ' $(adb root)
echo '=> ' $(adb -s $emulator_name remount)
echo '=> ' $(adb -s $emulator_name push ./hosts /system/etc/hosts)

# Mostramos el contenido actual del fichero hosts del emulador
echo '=> Contenido del fichero hosts en el emulador tras actualizarlo'
adb shell cat /system/etc/hosts
adb unroot