## Adele : Administration Environnement E Learning


## Objectif

Outil d'administration pour déployer les plugins de Moodle avec git (sans utiliser les commandes git sub modules). 
Il s'agit de gérer une base de code construite à partir d'une version de Moodle et d'y integrer une liste de plugins.
L'utilisation de git pour gerer les sources de Moodle et des plugins permet de conserver un historique des mises à jour.
Un fichier de configuration décrit l'état souhaité de votre projet: 

```bash
  moodle:
    version: 4.5+

  plugins:
    moodle-report_benchmark:
      source: https://github.com/mikasmart/moodle-report_benchmark
      branch: master  
    moodle-filter_filtercodes:
      source: https://github.com/michael-milette/moodle-filter_filtercodes
      branch: master
      version: v2.6.1
```    
L'outil construira pour chaque projet une base de code conforme à l'état demandé
En cas de modifications (mise à jour mineure de Moodle, ajout d'un nouveau plugin, mise à jour d'un plugin,.. ) l'outil mettra à jour la base de code à jour pour obtenir le nouvel état demandé. 

Un adminstrateur Moodle est amené très rapidement à gérer de multiples environnements.
selon les cas il s'agit :
- de gérer plusieus projets
- d'avoir des environnements de développment, test, production distincts
- de tester un nouveau plugin
- d'installer une mise à jour de moodle et/ou d'un plugin
Cette même base de code sera déployée dans différents environnements.

## Les fonctionnalités

- gestion d'une base de code par projet
- gestion de la version des composants (moodle, plugins)
- sélection des plugins à parir du répertoire officiel Moodle 
- import de plugins à partir d'autre sources
- possibilité de gérer en local une version personnalisée des plugins (customisation)
- multi projets : différentes version de Moodle, différentes listes de plugins
- factorisation du code des composants du projet: pas de duplication de code
- conservation de l'historique des changements
- création d'environnements reproductibles
- automatisation des mises à jour : montée de version mineures de Moodle, ajout, mise à jour de plugins

## Pre requis

l' outil est un script bash qui fonctionne dans un environnement Linux avec les pre requis suivants:
- installation de git pour récupérer les sources de Moodle
```
  sudo apt install git

```

- installation du package jq pour lire les fichiers au format json
```
  sudo apt install yq

```

- installation [yq](https://github.com/mikefarah/yq/#install) pour lire le fichier de configuration au format yaml
  pour sous unbuntu/debian pour installer la derniere version
  ```
    sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    sudo chmod +x /usr/bin/yq

  ```

## Pour démarrer:

cloner le dépot sur votre environnement de travail puis depuis ce répertoire ./adele

```bash
  git clone https://gitbub.com:cbillon/adele.git
  cd adele
  ./adele
```

le script contient un projet de démonstration : demo
Lancer la mise à jour du projet
L'outil enchaine les traitements suivants:
- création d'un depot local de Moodle
- création d'un dépot local des plugins à installer
- construction de la base de code








Pour afficher  fichier markdown README.md

pandoc -s -f markdown -t man README.md | groff -T utf8 -man | less

un adminstrateur Moodle est amené tres rapidement à gere de multiples environnements.
selon les cas il s'agit :
- de gerer plusieus projets
- d'avoir des environnements de developpment, test, production distincts
- de tester un nouveau plugin
- d'installer une mise à jour de moodle et/ou d'un plugin
- ..

Un projet Moodle :
- version Moodle 
- une liste de plugins additionnels

il est à noter que nombreux élements sont partagés par ces différents environnements

La base de code d'un projet est constituée par une version source de Moodle
Les plugins additionnels sont inclus dans des sousrepertoires
La base de code d'un projet est re utilisée pour les doffrents environnements (dev, qa, prod, ...)
Il s'agit de gérer la base de code initiale mais aussi son évolution (corrections dans Moodle, ajout d'un nouveau plugin, nouvelle version d'un plugin, personnalisation d'un plugin...)

L'objet de ce script est d'avoir une base de composant source unique pour gérer ces differents environnemts.

Tous les sources sont gérésen local  dans des dépots git
- un dépot source Moodle
- un dépot pour chacun des plugins additionnels

Les avantages :


- le partage des éléments communs entre les projets facilite la maintenace et diminue l'espace disque occuppé
- gestion de depots git standards (moodle, plugins)
- traçabilité des mises à jour
- mise à jour automatique des version mineures de Moodle, des plugins
- facilités pour migrer vers une version majeures de Moodle


## Installation ##
Le script fonctionne sous Linux (fichier BASH)

Pre requis
- git
- pandoc pour afficher la documentation
- git-subrepo
- yq pour lire les fichiers yaml

### installation de git ###

 sous Debian/ubuntu: apt-get install git 

### installation de yq ###

La liste des plugins d'un projet est au format yaml
Le module yq permet de lire ce type de fichier

[yq](https://github.com/mikefarah/yq)

```
  sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
  sudo chmod +x /usr/bin/yq

```

## pour démarrer

- installer les pre requis
- dans votre environnement de travail : git clone https://github.cm:cbillon/adele
- puis 
    cd ./adele
    ./adele

  la commande permet de configurer un premier projet

  Parametres: version Moodle : par defaut la derniere version dispobible 4.5
              nom de la branche de la base de code : par defaut le nom du projet

  pour ajouter un plugin 
  
  - sélectionner dans le menu: Edition de la liste des plugins du projet
  - mettre à jour la liste

  la mise à jour de la base de code es faite autmatiquement

## Configuration Adele

le fichier de configuration env est situé à la racine

```
  RACINE="${PWD}"
  PROJECT_PATH="${RACINE}/projects"
  DEPOT_MODULES="${RACINE}/modules"
  MOODLE_SRC="${RACINE}/moodle"
  RELEASES="${RACINE}/releases"
  DEBUG=true
  MOODLE_HQ=https://github.com/moodle/moodle.git
  #MOODLE_FORK=git@github.com:cbillon/moodle-hq.git
  MOODLE_VERSION='4.4+'
  MOODLE_DEPTH=1
  MOODLE_UPDATE_ORIGIN=N
  PLUGIN_UPGRADE_AUTO=true
  
```                   



## Principes de fonctionnement ##

On crée localement 
- une copie du depot git de Moodle qui devient le depot des projets
  chaque projet est une branche du depot
- une copie du depot git des plugins à installer

La commande git-subrepo permet d'inclure le source des plugins dans de depot Moodle local

les dépots (projets, plugins) restent des depots git standard

Le script cree une version initriale et permet une mise à jour du projet :
- à partir du depot officiel de Moodle
- quand un plugin est mise à jour : mise à jour du fournisseur du plugins et/ou modifications locales

La mise à jour d'un plugin proviennent du depot du développeur ou d'une personnalisation du pligin. 

La gestion sous git des sources du projet ainsi que des plugins additionnels  permet d'avoir un historique des mmises à jour et d'automatiser les mises à jour. 


### Création fork du dépot Moodle ###

2 possibilités:
- à partir de'un fork du depot moodle hq dans un depot perso github
- à aprtir d'un clone du depot moodle hq

In fine :
on a le dépot moodle hq de reference en tant que upstream
le depot contenant la sauvegarde remote est origin

Sur github on cree un fork du depot Moodle HQversion: v2.6.1moodle-filter_filtercodes:
    repo: github
    owner: michael-milette
    branch: master
* dans ce répertoire le répertoire des sources moodle, des releases  

Le fichier de configuration du projet <nom-du-projet>.cnf  est présenté 

Mettre à jour le fichier de configuration généré /<racine>/scripts<nom du projet>.cnf est présenté pour mise à jour

* l'origine du projet FORK= true (or false) 
* la source du depot des source  Moodle 
* VERSION de Moodle utilisée
* parametre DEPTH (pour supprimer commenter #)
* la mise à jour en retour de la base de code du projet


  

## Les options du menu

### 0 Mise à jour Moodle depuis le dépot de référence

Le depot source MOODLE_SRC fait reférence a 2 dépots remote:
- upstream : le dépot de référence de  Moodle
- origin: le depot source du projet

Les étapes
- mises à jour fetch upstream
- mise à jour de MOODLE_<version>_STABLE
- mise à jour de la branche BRANCH_PROJET 


### 1 Liste des plugins du projet
    A partir du fichier <nom du projet>.plugins

### 2 Import d'un plugin
    Source : github,  bitbucket, gitlab, local
    dans le cas de bitbucket si owner=cbillon on utilise les clés ssh pour recupérer le module
    dans le cas local on vérifie que le plugin est dans $DEPOT_MODULES
    
    une entrée est est créée dans le fichier <nom du projet>.plugins

### 3 Mise à jour base de la base de code

    A partir du fichier <nom du projet>.plugins
    Pour chaque item
      . recherche du plugin dans le depot modules
      . vérification de l'installation du module :
        . pas installé : ajout du module dans la base de code
        . installe mais pas à jour : mise à noveau dans la base de code par rapoort au depot modules
        . installé à jour : ok
       
### 4 Déploiement 

### 5 Restoration d'une version

### 6 Suppression d'une ancienne version

### 7 Suppression d'un plugin

### 8 Recherche des mises à jour des plugins du projet
    
   A partir du fichier <nom du projet>.plugins

   Pour chaque item vérification de sa presence dans le dépot des modules
   Si le module est present , mais il y une version plus recente sur le depot du développeur message d'information    
    

### 9 Push new version origin

l'option MOODLE_UPDATE_ORIGIN doit être à Y
Il ne doit y avoir de mmodifs en cours (etat clean du depot)

La branche REMOTE_BRANCH est miseà jour par fusion avec BRANCH_PROJET
Le résultat est poussé sur le depot origin

## FAQ

## distribution des sources Moodle

Cloning Moodle LMS using the git command can be incredibly beneficial, particularly for reducing the process of updating your site from hours to minutes, managing modifications you may have made to the core code, and improving collaboration among development teams. 
https://www.elearningworld.org/git-enabling-an-existing-moodle-installation-a-step-by-step-guide/
## Gestion des version Moodle

version Moodle: 4.4.1

les 2 premiers chiffres indiquent la **version majeure** de Moodle
le dernier chiffre la **version mineure**

A chaque version majeure correspond une branche git
Par exemple Moodle 4.4 -> se trouve dans MOODLE_404_STABLE
Chaque version majeure indque les pre requis systeme nésssaire pour installer la version : version php (8.1; 8.2...) version base de données..
ces informations se trouvent dans le document release note qui accompagne chaque nouvelle version

Lors de la montée de version mineure; il n y pas de modifications des pre requis systeme ni des API Moodle ; la nouvelle version mineure comporte des corrections, 
ainsi que des nouvelles fonctions
Un plugin qui fonctionne  doit continuer à fonctionner lors d'une montée de version mineure.



### Création d'un nouveau projet version MOODLE

Lors de la création d'un nouveau projet on sasit la version MOODLE par exemple 4.4


One way could be that:

    Create a repository where you put all your plugins and store it as a branch suitable to your moodle version.
    Create a repository with your moodle and as you already have done create a branch of your own suitable to your moodle version.
    Merge the repository from 1) into the repository from 2)

Davo Smith

There are lots of different ways to handle this situation (so I'm sure others will weigh-in with alternatives), but the way we handle it is as follows:

    For minor releases (3.5.2 => 3.5.3, etc.):
         we checkout the latest Moodle code (MOODLE_35_STABLE)
        then checkout our branch
        then create a new branch based on our current branch (all our branches are named m_3.5.2_customer, in order to keep track of our exact version)
        then use git rebase to move our new branch on top of the latest MOODLE_35_STABLE
        deploy this new branch
        Note, an alternative is to simply rebase the current branch on top of the latest MOODLE_35_STABLE, but after doing a rebase you have to do a push --force, which can cause issues if other people were working on that branch
    For major releases (3.5 => 3.7):
        Create a new branch based off the Moodle code (MOODLE_37_STABLE)
        Download the latest versions of all plugins and add them to the code (many of the plugins will have newer versions released, so it is easier to install them all fresh, rather than trying to go through and add the updated versions)
        Commit each plugin as a separate commit (makes it a lot easier to review the list of custom plugins)
        Cherry-pick any core changes + custom plugins (sometimes taking an opportunity to squash the commits if there are a lot of minor bug fixes we don't need to retain the history of).

Depending on how many plugins there are to install, the major upgrade prep rarely takes more than 30-60 minutes for a customer.

David Mudrak



You might be able to "replant" your MyPD branch onto 3.7 with the git rebase --onto command.

Basically something like

# git rebase --onto MOODLE_37_STABLE MOODLE_35_STABLE MyPD

which does something like "take all commits on the MyPD branch that are not present on the MOODLE_35_STABLE branch and re-apply them on top of the MOODLE_37_STABLE branch". Read the fine manual for more details.

Like others already mentioned above, there are many creative ways you can use Git to compose code for your customized Moodle sites. In HQ we ended up with maintaining a separate branch for every single plugin or core modification. We follow a strict naming scheme for these branches which allowed us to have helper scripts for common tasks such as "take that one particular core hack we used on moodle.org and re-use it on another site" etc.

Anthony Borrow
let's assume that a site wants to use git to keep their code base easy to modify and easy to update.

A common branch names for additional plugins
https://moodle.org/mod/forum/discuss.php?d=454264
Andrew Lyons

From my experience, the vast majority of plugins have a single branch, and attempt to support all current versions of Moodle with a single plugin version.

Personally I'd like to see that change a little with one branch per set of releases (with a set ending on the LTS release

Davo Smith
I think the fundamental question here is why you are trying to pull code from github, not from the Moodle plugins directory.

Github usually contains the latest "in development" code, the code in the Moodle Plugins directory is the version that has been published and declared stable.

You might be better off with the process that some of our internal scripts use, that downloads the data from: https://download.moodle.org/api/1.3/pluglist.php then uses the relevant download URL in that to get the zip file of the plugin in question. After that, it's just case of deleting the existing directory, unzipping the new version of the plugin into that location, then committing the update.

Al Rachels

From personal experience of working on "old" plugins to keep them working, I must say there is NO magic way of using git to update all your plugins, without doing a lot of manual checking to see what is the latest version of a plugin. The reason is that most developers do NOT follow a set standard branch naming convention, and they certainly do not issue a specifically named branch to go along with a specifically named Moodle

The only problem with the above, is there are a few developers who do not publish new versions to Moodle anymore, but only put new versions on their github accounts. And a couple those use such poor branch naming conventions, that it is difficult to know exactly which one to use.

Davo Smith répond

The normal source of plugins that are ready to install on production sites is the Moodle plugins directory.

I'm also not suggesting you write individual git commands or manually install anything, I'm simply suggesting an automated script that pulls plugins from the Moodle plugins directory (gathering the details from the JSON file at the URL I already posted), then adding them to your git repo. Run the script, it fetches everything and commits it to your git repo - it should work for all existing sites and doesn't require any change in process for the deployment of your sites (assuming you are just deploying the branches from your repo for those sites).

As I said above, I know this process can be automated, because it's the main principal behind an internal script we've used to do something similar ourselves (but which also handles a lot of other internal processes, so not suitable to be shared).
Visvanath Ratnaweera

Developers of plugins do have to get their submission vetted and approved for listing in Moodle's plugins site. But from what I've read in the past, plugins are not checked ever again. It is up to developer of the plugin to maintain. Think they also have enough access to moodle HQ's plugin site to upload their latest versions.

The only missing part is clear instructions on how to set up and name the Git branches.

Proposal Visvanath Ratnaweera

Here is a proposal.

Andrew Lyons - Thursday, 11 January 2024, 03:30 UTC wrote:
>
> From my experience, the vast majority of plugins have a single branch, and attempt to support all current versions of Moodle with a single plugin version.
>
> Personally I'd like to see that change a little with one branch per set of releases (with a set ending on the LTS release - e.g. 4.2-4.5 is a set).

Now that the "set of releases", newly called series, is getting formalized in the core, what remains it to request the plug-in developers to open a branch per series,  Ref. Versioning and Deprecation changes.

Versionning and depreciation changes Matt Porritt
https://moodle.org/mod/forum/discuss.php?d=457946

Currently, the first two numbers for a version represent the major version, and the third number represents the minor version. There haven’t been set rules as to when the first number is increased, and since Moodle 2.0 there has not been any special meaning to it. The changes to this number for 3.0 and 4.0 were somewhat linked to major underlying changes in LMS, but the size of this change itself was variable. This unpredictability makes it challenging for administrators and developers to understand what an increase in version number means.

To address this we are making the change to add more meaning to version numbers, starting from version 4.5 LTS. The changes are:

    The first part of the version will now represent a Series
    The last release in each Series will be an LTS release
    The next major release after an LTS will mark the beginning of a new Series
Series 5:

    5.0 Standard release (Release: 21st April, 2025)
    5.1 Standard release
    5.2 Standard release
    5.3 LTS release - This is the last release in the 5.x series.

Starting from LMS version 4.5 We are also updating the deprecation policy for Moodle LMS to align more closely with the LTS cycle. The changes are:

    Deprecations will now be aligned with the LTS release cycle, providing a clear timeline for when   deprecated features need to be updated or removed.
    Features deprecated before an LTS release will be removed in the release following that LTS. 

This adjustment means the shortest deprecation period will be 12 months, down from the previous 24 months. Features that have been deprecated in LMS version 4.3 or 4.4 will be affected by this new approach; they will be removed in 5.0, which is the version after the 4.5 LTS.
There are no plans to change the current general and security support time periods for either general or LTS versions of Moodle LMS.
This decision is based on a balance between providing extended security support, which is crucial for stability and compliance, and managing the resource allocation that allows us to continue advancing the platform with new features and enhancement

Dan Marsden

I know the HQ team spent a lot of time looking into the various version naming options - what they have settled on here lining it up with the deprecation process makes quite a lot of sense to me and should simplify a number of things.

One big advantage that might not be clear is that if a 3rd party plugin works in 5.0 it should also work fine in 5.3, but then may break in 6.0 - we also like the last release in the series being the LTS version to

Dan Marsden proposal

What we do here at Catalyst with most of our plugins is that we don't use a branch named "main" at all, the latest branch name will be named after the earliest Moodle branch it supports.

example:

Saml2 has a current "latest" branch name called "MOODLE_39_STABLE" - this supports all versions since MOODLE_39_STABLE

If something in Moodle 5.0 means we have to create a new branch - we call that new branch MOODLE_500_STABLE and then when something after that means we need a new branch, we create MOODLE_600_STABLE etc.

This means if a Moodle 4.1 site using submodules linking to MOODLE_39_STABLE still functions correctly and you don't need to change the branch it's currently using.

Davo Smith


The simple answer is, that Moodle does enforce a versioning concept on plugins - it's built-in to the Moodle plugins directory.

If you pull the data from there, you get a list of which released version of each plugin is suitable for any given version of Moodle, along with a link to download it (there's a 7MB JSON file you can pull down with everything in it - that's what our company's internal tools use for managing 3rd-party plugins).

Some plugins may support and encourage people to download them from github, in which case feel free to do so.

I can state, for example, that none of my own plugins offer stable versions in github - you can download from there if you want, but the stable, supported versions are in the Plugins directory. There is no need for me, as a plugin developer, to conform to any particular branching scheme, because github is just the place where the current development code is kept for the plugin.

Often new code is merged into the branch in github and then I wait to see results of the automated tests to make sure I've not accidentally broken something in one of the other branches (or with a certain PHP version).

I can also sometimes fix a bug in github and ask the reporter to confirm that the fix has solved the problem (and not immediately introduced some other issues).

In both of those cases, I don't send the new code to the Moodle plugins directory until I'm (more!) confident that I've not caused a problem with the updated code.

Much of the time the code in github and the plugins directory is identical (especially as I don't make that many changes outside of Moodle major releases), but there are windows of time when github contains code that is more likely to have issues.

During my work time, we carefully manage our branches and have a QA/UAT process whilst moving between branches (plus we don't have to worry about supporting multiple Moodle versions at once, as each customer we are writing the code for is only on a single Moodle version). In my spare time, when I maintain my own plugins, I'm not really willing to put in the extra time required for that level of branch management.

Dan Marsden
there's a lot of variation on that for plugin developers too.... Here at Catalyst - the latest stable releases for our plugins will always be in github - we don't actively push out versions to the plugins db, but are slowly rolling out auto-deployment to plugins db based on github workflows. We don't rely on versions in the plugins db ourselves at all - we automate updates using git/submodules/CI processes.

Davo Smith persiste et signe

 As an individual plugin developer, mostly maintaining my own plugins in my spare time, I don't have the resources to undertake such an approach, so I keep the development code in github and only deploy it to the Moodle plugins directory when I am (reasonably) confident it is fully tested and working.
 
(Almost) every plugin points to a git repository, how do you know if you should use them directly?
The git repositories are there for anyone who wants to directly access the current work-in-progress development code, or to submit bug reports or patches. If someone writes in the plugin documentation, for a particular plugin, that they make the latest stable code available on a particular branch in github, then it is probably safe (or at least safer) to use it from there. Otherwise, I would assume that the Moodle plugins directory is the place to find the stable code (after all, that is where Moodle itself downloads plugins from, if you install plugins directly from the Moodle admin UI - it does not support downloading plugins from their associated github repositories).

Johannes Burk

Since I like managing things with git I'd love to see every plugin using some consistent model which links stable releases to specific commits. But I don't think it is desired or even possible to force plugin developers to something. 

My idea is to recommend git as the source control system for plugin development and make some recommendations regarding versioning, branch naming and tag usage. I know that it is not safe to assume that the latest commit of something is stable. Therefore I would always recommend to use git tags for releases. The Moodle plugin directory already supports linking a plugin version to a VCS tag! Additionally a stable branch per series could help finding the correct version when working with git only. When a developer takes "stable" branches serious (and makes use of the feature branching model) then it should be safe to use the latest commit of such a stable branch. And since branches are cheap why not use multiple branches pointing to the same commit if nothing on the plugin side changed between two or more Moodle series. 

What I'm currently missing is a recommendation for a human readable plugin version ($plugin->release). ... And a wider adoption of $plugin->supported, $plugin->incompatible and the specification of a VCS tag in the plugin directory. 


Things deprecated before an LTS will be deleted in the next major version (the new Series).
Anything deprecated in the LTS will not be deleted until after the next LTS.

Whilst that would be great for a clean series start side of things, it makes it harder to upgrade form LTS to LTS. wHY?
