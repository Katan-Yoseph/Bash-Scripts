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
	 lynx --dump $1 | grep "http" | cut -d "/" -f 3-5 | cut -d "/" -f 1 | cut -d ":" -f 1 | sort | uniq > output.log 
		
	echo "##############################################"
	echo "#              Resolving Addresses           #"
	echo "##############################################"
	echo "From: $1"
	echo ""
	for linha in $(cat output.log);
	do 
	        echo " |- $linha -| "	
		echo "$(host $linha)"
		echo "-------------------------------------------------------------------------"
	done
	rm -r output.log

fi
