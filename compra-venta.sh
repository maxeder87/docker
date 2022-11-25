compra=$( curl -X GET 127.0.0.1:5000/usd 2>/dev/null | ./jq ".compra")
venta=$( curl -X GET 127.0.0.1:5000/usd 2>/dev/null| ./jq ".venta")
touch outs.txt
fecha=$(stat -c %y  outs.txt)
while true
do
	nuevafecha=$(stat -c %y  outs.txt)
	if [[ $fecha != $nuevafecha ]]
	then
		fecha=$nuevafecha
		echo "precio de usd compra : "$compra 
		echo "precio de usd venta : "$venta
	fi
	sleep 5
done

