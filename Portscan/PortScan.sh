#!/bin/bash
if [ "$1" == "" ]
then
	echo "Port Scan"
	echo "Modo de Uso: $0 REDE"
	echo "Exemplo: $0 10.88.51"
else

	for host in {1..254};
	do
		hping3 -S -p 80 -c 1 $1.$host 2> /dev/null | grep "SA" | cut -d " " -f 2 | cut -d "=" -f 2;
	done
fi
