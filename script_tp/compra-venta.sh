compra=$( curl -X GET web_server:5000/usd 2>/dev/null | jq ".compra")
venta=$( curl -X GET web_server:5000/usd 2>/dev/null| jq ".venta")
touch outs.txt
fecha=$(stat -c %y sync/outs.txt)
while true
do
	nuevafecha=$(stat -c %y  sync/outs.txt)
	if [[ $fecha != $nuevafecha ]]
	then
		fecha=$nuevafecha
		echo "precio de usd compra : "$compra 
		echo "precio de usd venta : "$venta
	fi
	sleep 5
done

