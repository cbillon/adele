# Préambule

Un outil d'administration en ligne de commande pour aider au déploiement de plugins Moodle via Git (sans utiliser les commades git submodules).
Il s'agit de gérer une base de code construite à partir d'une version de Moodle et d'y intégrer une liste de plugins.

Vous décrivez la configuration souhaitée dans un fichier au format yaml:

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


![Boucle de controle](../pictures/Boucle_de_controle.png)
Image fournie par Ian Miell 
Le script construira pour chaque projet une base de code conforme à l'état demandé.
En cas de modifications (mise à jour mineure de Moodle, ajout d'un nouveau plugin, mise à jour d'un plugin,.. ) le script mettra à jour la base de code à jour pour obtenir le nouvel état demandé. 


L'utilisation de git permet de gérer la base de code :
- son état initial
- son évolution (historique des versions)

L'utilisation de git permet de recréer un état antérieur de la base de code.

Pour démarrer un tutorial se trouve [ici](docs/tutorials/Getting-started.md) 

# Organisation du projet



## La documentation se trouve dans le répertoire **docs** :
- explanations: documents sur des sujets connexes au projet
- how-to-guides: comment faire 
- reference : document de référence sur les parametres
- tutorials : pour démarrer



