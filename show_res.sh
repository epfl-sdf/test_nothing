#!/usr/bin/env bash
#petit script pour afficher le résultat en temps réel
#zf170719.1630, zf170731.212

T1=$1"_ok.txt"
T2=$1"_nothing.txt"
T3=$1"_no_logon.txt"

watch -n 1 "wc -l $T1 && wc -l $T2 && wc -l $T3"


