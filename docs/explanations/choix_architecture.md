# Choix Architecture

nous avons fait les choix suivants :
- utilisation de git source unique de vérité
- mode déclaratif : un fichier unique de configuration

L'état des ressource (version Moodle; version des plugins) est donné par git
Le script a pour fonction de reconcilier l'état observé avec l'état demandé. 
## Git

Moodle utilise Git depuis plus de 10 ans comme outil de versionnange des sources.
Une base de code Moodle est un assemblage contutué à partir 
- d'une version Moodle 
- une liste de plugins

Le répertoire officiel des plugins agréés par Moodle fournit le dépot git des sources des plugins. 
Le fait de tout gérer sous git présente plusieurs avantages;  en particulier
- définition précise de ce qui est installé
- pouvoir reconstruire un état antérieur
- automatisation de la génération des bases de codes

Le script peut gérer plusieurs projets distinctes: ces diffrentes instances partgent les ressources dans le cache (Moodle, plugins).
L'automatisation des tâches de mise à jour est essentielle pour la fiabilité des opérations ainsi que pour le gain de temps.
Les mises à jour de Moodle corrigent bon nombre de failles de sécurité mais souvent ne sont pas installées à cause de la 
lourdeur des opérations manuelles [voir Eduardo Kraus](https://moodle.org/user/view.php?id=1428341&course=5)
La possibilité de reconstruire la base de code à un état donné est essentielle en cas de problémes.
[ce qu'un crash complet de notre production m'a appris](https://www.youtube.com/watch?v=IY3S4l81aB4)

## Mode déclaratif

Impérative et déclarative sont les deux principaux paradigmes de programmation. La programmation impérative se focalise sur « comment », alors que la programmation déclarative se concentre sur « quoi ».

En d'autres termes, là où les langages impératifs décrivent les étapes à effectuer, les langages déclaratifs décrivent directement le résultat désiré.

Notre base de code est contitué à partir d'une version Moodle et d'une liste de plugins

Le fichier de confuguration décrit l'état de chacune des composants :

- etat de Moddle 
- etat de chaque plugin

Le script effectue la re concialition entre l'état demandé et l'etat courant observé

Les événements suivant nécessitent une reconciation :
- livraison de mise à jour moodle(fixes, version mineure,...)
- mise à jour de plugins (nouvelle version, version customisée pour le site)
- modification du fichier de configuration (ajout, suppression de plugins, ...)











