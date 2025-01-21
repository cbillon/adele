# Les étapes

la génération d'une basz de code  est composée de 3 étapes
- 1 Mise à jour du cache local (Moodle, plugins)
- 2 Mise à jour de la configuration , intégration 
- 3 livraison d'une version 

## Mise à jour du cache local

### Moodle

Initialement le dépot local Moodle est mise à jour lors de la création d'un nouveau projet.
Ensuite il est mis à jour par le lnacement de la commande **Mise à jour du cache Moodle**

### Plugins

A partir des information fournies par le répertoire officiel des plugins la commande **Import d'un plugin** met à jour le cache local (clone du depot git du plugins)

Il est possible d'integrer des plugins non officiels en mettant directement à jour le fichier de configuration. 

## Mise à jour de la configuration, intégration

La liste des plugins à ontegrer dans la base de code est fournie par le fichie de configuration
L'état du plugin est donné par les parametres : branch, et/ou version
- branch du plugin
- version : tag ou commit 
L'installation d'un plugin consiste à recopier le source dans un réprtoire du source Moodle
L'emplacement est déterminé par le nom normalisé du plugin moodle-<type>_<name>
Le type determine l'emplacement dans le source Moodle, name le nom du reperttoire

La version du plugin dépend de la version Moodle: Moodle n'a pas donné de recomandations, ce qui fait que plusieurs façons de faire existent
Le szcript determine au mieux la version: ceci doit etre verifié et eventuelement corrigé par l'administarteur

L'administrateur peut ajouter les plugins non "officiels" : il doir préciser alors le source du dépot git, la version utilisée
De même l'Administrateur peut supprimmer un plugin d'un projet en le supprimant simplement dans le fichier de configuration (il devra aussi penser à le desinstaller dans les environnements ou la base de code avait été déployé)

## Intégration

Chaque instance de code correspond à une branche du dépot Moodle mise à jour lors de l'installation d'un plugin.

## Livraison
 
 Par rapport à l'étape précédente on ajoute une étiquette qui marque une étape 
 Ceci permet de déplyer la version de la base de code dans difrents environnements : test, staging, prod
En cas de probléme on corrige et on regenere une nouvelle version.












