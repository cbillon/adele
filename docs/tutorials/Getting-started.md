
# Création d'un nouveau projet


Nous allons creer une base de code Moodle pour un nouveau projet :
- Version Moodle 4.5 avec les derniers fixes
- 2 plugins : moodle-tool_opcache, moodle-tool_redis
- livraison d'une base de code
- ajout d'un nouveau plugin
- nouvelle livraison d'une base de code

## Pre requis

L' outil est un script bash qui fonctionne dans un environnement Linux avec les pre requis suivants:
- installation de git pour récupérer les sources de Moodle

```bash

  sudo apt install git

```

- installation du package jq pour lire les fichiers au format json

```bash

  sudo apt install yq

```

- installation [yq](https://github.com/mikefarah/yq/#install) pour lire le fichier de configuration au format yaml
  pour sous unbuntu/debian pour installer la derniere version
  ```bash

    sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
    sudo chmod +x /usr/bin/yq

  ```
## Installation

cloner le dépot dans votre environnement de travail, puis depuis ce répertoire: ./adele

```bash

  git clone https://gitbub.com:cbillon/adele.git
  cd adele
  ./adele

```

## Les étapes

- 1 création d'un nouveau projet  
- 2 Installation des plugins
- 3 Mise à jour de la base de code
- 4 Génération d'une nouvelle livraison
- 5 Ajout d'un nouveau plugin moodle-report_benchmark
- 6 Mise à jour de la base de code
- 7 Génération d'une nouvelle livraison
- 8 Mise à jour Moodle


### Création du nouveau projet

Nommez le projet par exemple: demo

A chaque projet est associée un base de code.
La création d'un nouveau projet entraine une mise à jour d'un clone du dépot Moodle (cache local)
Le fichier de configuration de la base de code s'affiche

Il comporte:
- la version source de Moodle 
- la liste des plugins à installer (cette liste est vide au démarrage)

#### Version de Moodle

La version Moodle est précisée lors de la création du projet.
L'option définie ici est 4.5+
cela designe la derniere version mineure de Moodle disponible avec les dernieres mises à jour hebdomadaires.
Il est possible de définir une version figée : 4.5.1 par exemple.
Les différentes options du fichier de configuration sont détaillées [ici](../reference/conf.md)

### Mise à jour des Plugins additionnels
2 étapes :
- mettre à jour le depot des plugins (cache local)
- ajouter le plugin au projet

#### Mise à jour du cache des plugins

Choisissez dans le menu **Import d'un plugin**

A partir du nom saisi par l'administrateur l'outil va chercher des information dans le répertoire officiel des plugins agréés par Moodle.
Le script récupere :

- la description
- la source du dépot git
- la version 

le dépot du plugin est cloné en local (mise à jour du cache local)
    
nota : Moodle HQ n'a pas codifié de façon précise comment est gérée la gestion des versions des plugins, ce qui fait qu'il existe différentes pratiques.

Le script propose une version, et laisse à l'administrateur la possibilité de modifier cette proposition. 

Le cache des plugins est partagé par toutes les instances de base de code (factorisation).

nota : il est possible de choisir un plugin qui n'est pas dans le répertoire officiel en mettant à jour directement le fichier de configuration.

### Mise à jour de la configuration

En lançant la commande : **Ajout d'un plugin au projet**

Le script présente la liste des plugins présents dans le cache
L'administrateur sélectionne les plugins à intégrer dans la base de code
Le script récupere l'url du depot git du plugin

dans le fichier de configuration 2 parametres obligatoires:
- source : url du depôt git du mainteneur
- version : version du plugin à utiliser, doit être compatible avec la version Moodle

La version peut être :
- une branche 
- une étiquette (tag)
- un commit   
C'est cette information qui donne l'état de la ressource , qui sera utilisée dans la boucle de conciliation.

Pour agréer un plugin Moodle demande au développeur d'indiquer un dépot git (la plupart du temps github), d'être compatible avec au moins 1 version Moodle maintenue,  mais n'a pas préciser comment gérer la dépendance avc les versions Moodle. 
Ce qui fait que plusieurs pratiques co existent :
- une branche unique 
- un branche pour chaque version Moodle
Le script détermine la version du plugin compatible avec la version Moodle, mais laisse la possibilité à l'administrateur de modifier cette proposition.