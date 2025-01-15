# Listamos los emuladores disponibles y pedimos al usuario que seleccione uno
emuladores=$(emulator -list-avds | grep -v '^INFO' | grep -v '^Storing' | grep -v '^crashdata')
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
emulator -avd $device -writable-system &
