#!/usr/bin/env bash
#petit script pour aspirer une liste de sites web qui se trouvent dans un fichier .csv
#zf170713.0937
#source: https://www.cyberciti.biz/faq/unix-linux-bash-read-comma-separated-cvsfile/

echo ---------- start

if [ -z "$1" ]
  then
    echo -e "\nSyntax: ./aspi.sh list_file \n\n"
    exit
fi
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

INPUT=$1
OLDIFS=$IFS
IFS=,

#élimine la première ligne !
#read name Server parent site_url_jahia site_url_wp site_title username_viewer pwd_viewer < $INPUT

timestamp=$(date +"%y%m%d.%H%M")
prefix=$timestamp"_"$(echo $1 | cut -d'/' -f 2)
rm -f $prefix"_ok.txt" $prefix"_ko.txt"

nblines=0
while read site_url_jahia url_wwp url_server_wwp site_title username_viewer password_viewer 
do
	echo $nblines
	if [ $nblines != "0" ]
	then
		./aspi.sh $site_title $username_viewer $password_viewer $prefix
	fi
	((nblines+=1))
	echo ""
done < $INPUT

IFS=$OLDIFS
