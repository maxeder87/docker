#!/bin/bash
install () {
	SYNC_PATH=$(pwd)/sync/outs.txt
	sed "s|\#reemplazame|$SYNC_PATH|" servicio/servicio.template > servicio/servicio.service
	sudo cp servicio/servicio.service /etc/systemd/system
	sudo cp servicio/servicio.timer /etc/systemdd/system
	sudo systemctl daemon-reload 
	sudo systemctl start servicio.timer

	sudo docker-compose up -d --build

