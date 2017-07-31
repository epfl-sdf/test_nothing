#!/usr/bin/env bash
#Petit script pour verifier si un site contient le texte "Nothing found" dans son corps.
#zf170719.1629, zf170731.2125
#source: https://stackoverflow.com/questions/22614331/authenticate-on-wordpress-with-wget


#test si l'argument est vide
if [ -z "$1" ]
  then
    echo -e "\nSyntax: ./aspi.sh site_name user passwd output_prefix \n\n"
    exit
fi

echo ---------- start test.sh

site=$1
login_address=$site"/wp-login.php"
log=$2
pwd=$3		#"z"
cookies="cookies.txt"
agent="Mozilla/5.0"
output_prefix=$4

echo "."
echo $1
echo $2
echo $3
echo $4
echo ".."
echo $site
echo $login_address
echo $log
echo $pwd
echo $output_prefix
echo "..."
#exit

# authenticate and save cookies
wget \
    --user-agent="$agent" \
    --save-cookies $cookies \
    --keep-session-cookies \
    --delete-after \
    --post-data="log=$log&pwd=$pwd&testcookie=1" \
    "$login_address"
#exit


# access home page with authenticated cookies
echo "charge la page"
RESULT=`wget --header='Accept-Language: en-US,en;q=0.5' --user-agent="$agent" --load-cookies $cookies -qO- $site`
#echo $RESULT | w3m -T text/html

if [[ $(echo $RESULT | grep "Username or Email Address") ]]; then
	echo "oups"
	echo $site >> $output_prefix"_no_logon.txt"
else
	echo "cela passe"
	if [[ $(echo $RESULT | grep "Nothing Found") ]]; then
	    echo $site >> $output_prefix"_nothing.txt"
	else
	    echo $site >> $output_prefix"_ok.txt"
	fi
fi

rm $cookies








#echo -e "
#il y a comme nombre de pages HTML:
#"

#find $server |grep '\.html' |wc


#wget http://portesouvertes.epfl.ch/templates/epfl/static_epfl_menus/header_en.jsp -P ./portesouvertes.epfl.ch/templates/epfl/static_epfl_menus/
#wget http://portesouvertes.epfl.ch/templates/epfl/static_epfl_menus/header_fr.jsp -P ./portesouvertes.epfl.ch/templates/epfl/static_epfl_menus/

