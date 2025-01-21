# Edition de la configration du projet

Lancement du script, sélection du projet, choix de la commande **Edition de la configuration du projet**

Quand l'administarteur ajoute un plugin au projet, le script met à jour le fichier de configuration
Les spécifications publiées par Moodle pour le développment de nouveaux plugins ne donne pas de directives précises pour gérer les versions.
Ce qui fait qu'on peut avoir :
- une seule branche,  la version étant géree (ou pas) dans les meta données du plugin
- une branche par version Moodle
- ...

le script détermine au mieux la branche à utilser à charge pour l'administarteur de valider ce choix.

L'éditeur permet d'afficher la configuration du pprojet en mode édition pour des mise à jour  eventuelles: 

- modification de la version d'un plugin
- ajout d'un plugin qui n'est dans le répertoire officiel
- suppression d'un plugin de la base de code
