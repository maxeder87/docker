compra=$( curl -X GET web_server:5000/usd 2>/dev/null | jq ".compra")
venta=$( curl -X GET web_server:5000/usd 2>/dev/null| jq ".venta")
touch outs.txt
touch historico.txt
fecha=$(stat -c %y sync/outs.txt)
while true
do
	nuevafecha=$(stat -c %y  sync/outs.txt)
	if [[ $fecha != $nuevafecha ]]
	then
		compra=$( curl -X GET web_server:5000/usd 2>/dev/null | jq ".compra")
                venta=$( curl -X GET web_server:5000/usd 2>/dev/null| jq ".venta")

		fecha=$nuevafecha
		echo "precio de usd compra : "$compra >> sync/historico.txt
		echo "precio de usd venta : "$venta >> sync/historico.txt
         
	fi
	sleep 5
done

