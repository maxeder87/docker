#!/bin/bash
install () {
	SYNC_PATH=$(pwd)/script_tp/sync/outs.txt
	sed "s|\#reemplazame|$SYNC_PATH|" servicio/service > servicio/servicio.service
	sudo cp servicio/servicio.service /etc/systemd/system
	sudo cp servicio/servicio.timer /etc/systemd/system
	sudo systemctl daemon-reload 
	sudo systemctl start servicio.timer

	sudo docker-compose up -d --build
}

install

