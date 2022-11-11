compra=$( curl -X GET 127.0.0.1:5000/usd 2>/dev/null | ./jq ".compra")
venta=$( curl -X GET 127.0.0.1:5000/usd 2>/dev/null| ./jq ".venta")
touch outs.txt
lineas=$(cat outs.txt|wc -l)
while true
do
	nuevaslineas=$(cat outs.txt|wc -l)
	if [ $lineas -ne $nuevaslineas ]
	then
		lineas=$nuevaslineas
		echo "precio de usd compra : "$compra 
		echo "precio de usd venta : "$venta
	fi
	sleep 5
done

