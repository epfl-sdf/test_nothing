#!/usr/bin/env bash
#petit script pour tester toute une liste de sites contient le texte "Nothing Found" dans son corps
#zf170719.1630, zf170731.1935
#source: https://www.cyberciti.biz/faq/unix-linux-bash-read-comma-separated-cvsfile/

echo ---------- start

if [ -z "$1" ]
  then
    echo -e "\nSyntax: ./batch.sh list_file.csv \n\n"
    exit
fi
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

INPUT=$1
OLDIFS=$IFS
IFS=,

timestamp=$(date +"%y%m%d.%H%M")
prefix=$timestamp"_"$(echo $1 | cut -d'/' -f 2)
#rm -f $prefix"_ok.txt" $prefix"_ko.txt"

echo "z"
echo $prefix
echo "zz"

nblines=0
#while read site_url_jahia url_wwp url_server_wwp site_title username_viewer password_viewer 
while read rando site_url_jahia url_wwp site_title url_console username_viewer pwd_viewer
do
	echo $nblines
	if [ $nblines != "0" ]
	then
#		./aspi.sh $site_title $username_viewer $password_viewer $prefix
		./test.sh $url_wwp $username_viewer $pwd_viewer $prefix
	fi
	((nblines+=1))
	echo ""
done < $INPUT

IFS=$OLDIFS
