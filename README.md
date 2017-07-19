# Verificateur de 404
Verificateur de URL pour savoir si les sites correspondants contiennent le texte `Nothing Found` dans leur corps.

# Utilisation

## Récupération du dépôt
On récupère le dépôt avec:
```
git clone https://github.com/epfl-sdf/test_nothing.git
```

## Installer les crédentials
On décrypte les crédentials utilisés pour le site WEB avec:
```
./acb_uncrypt.sh
```
ATTENTION: ici c'est MON crédential, donc je ne vous donne pas le password ;-)<br>
C'est à vous de mettre vos crédentials dans le fichier:

```
aspi.credentials.sh.template
```
et de faire après:

```
mv aspi.credentials.sh.template ../aspi.credentials.sh
./acb_crypt.sh
```

## Lancer le vérificateur
Simplement avec la commande:
```
./batch_aspi.sh fichier_liste.csv
```

Le fichier `fichier_liste.csv` est un fichier `.csv` qui, pour notre configuration, contient 6 colonnes.
