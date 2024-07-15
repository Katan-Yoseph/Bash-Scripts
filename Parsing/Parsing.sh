if [ "$1" == "" ]
then 
	clear
	echo "##############################################"
	echo "#          Parsing Web - How To Use          #"
	echo "#                                            #"
	echo "#      Example: ./Parsing.sh www.site.com    #"
	echo "##############################################"
else
	clear
	wget $1 > /dev/null 2>&1 
	grep "href" index.html | cut -d "/" -f 3 | grep "\." | grep -v "<l" | cut -d '"' -f 1 > output.log 2>&1
	rm -r index.html > /dev/null 2>&1
	
	echo "##############################################"
	echo "#               Resolving Hosts              #"
	echo "##############################################"
	echo "From: $1"
	echo ""
	for linha in $(tail -n +2 output.log);
	do  
		echo "$linha  ---->  $(host $linha | grep "address" | cut -d " " -f 4 | grep -v "address")"	
		echo "$(host $linha | grep "address" | cut -d " " -f 4 | grep -v "address")" >> ip.log
	done
	

fi
