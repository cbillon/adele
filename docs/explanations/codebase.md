# Base de code (Code base)

## Définition
Le terme codebase, ou code base est utilisé en développement de logiciel pour désigner l'ensemble du code source utilisé pour construire un logiciel ou un composant. 
Dans notre cas cela comprend les source de Moodle , ainsi que les sources des plugins.
Les sources sont disponibles sous format de fichier zip ou depuis un depot git
Les sources sont versionnés grâce à git système de gestion de versions le plus corramment utiloisé.
La base de code Moodle comprend :
- les sources Moodle
- les sources des plugins

Il y a seulement une base de code par appliprojet, mais il y aura plusieurs déploiements de l’application. Un déploiement est une instance en fonctionnement de l’application. C’est, par exemple, le site en production, ou bien un ou plusieurs sites de validation. 
La gestion des sources sous git permet d'avoir un historique des versions sucessives, et de reconstruire un état antrérieur.
## Dépendances

La version de plugins à installer dépond de la version de Moodle
Ces dépendances sont décrites explicitement dans le fichier de configuration

Le fichier de confuguartion définit un état des ressources
- Moodle
- les plugins

Le role du script est d'amener la code base à l'état demandé


## Multi instances

Le script permet de gerer plusieurs instances de base de code d'une m^me version Moodle ou d'une version diffrentes avec pour chque instannce sa propre liste de plugins.

L'utilisation de git permet de factoriser les sources
- un depot Moodle
_ un dépot de chaque plugin

## Déploiement

Le déploiement comprendtout ce qui est susceptible de varier entre des déploiements (validation, production, environnement de développement, etc.). 
dans le cas de Moodle cela est défini  par le fichier configuration config.php
Déploiement
- base de code du projet + config.php coreepondant à l'environnement

