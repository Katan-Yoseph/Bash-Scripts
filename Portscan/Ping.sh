#!/bin/bash
if [ "$1" == "" ]
then
	echo "Ping Sweep"
	echo "Modo de Uso: $0 REDE"
	echo "Exemplo: $0 10.88.51.11"
else
	for host in {1..254};
	do
		ping -c 1 $1.$host | grep "64 bytes";
	done
fi
