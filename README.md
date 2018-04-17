PROJET : ENVOIS D'EMAIL EN MASSE

Ce projet consiste à scrapper les adresses email des mairies du 3 départements (44, 95.. ) avant de leur envoyer un email pour présenter les atouts de THP.


Réalisé par Team Courgette composée de : 
- Ana Zegheanu
- Tatijana Rajcic
- Olivier Dumas
- Richard Jackson
- Paul Aguadisch


Arborescence du projet :

1- Dossier Scrapper : Scrapping des adresses mail des mairies
- fichier
-fichier

2- Dossier Database : contient les informations relatives aux mairies par département
- fichier annuaire.csv : résultat du programme de scrapping pour récupérer les emails des mairies

3- Dossier Mailer : regroupant les départements, les noms des villes et les adresses emails correspondantes
- fichier townhall_mailer.rb : programme pour envoyer des emails à toutes les mairies
- fichier annuaire.csv : résultat du programme de scrapping pour récupérer les emails des mairies

3- Dossier Twitter : Programme d'envoi d'emails à ces mairies
- fichier .. Bot twitter permettant de relancer les mairies
- fichier ..

4- Readme.md : guide explicatif de notre projet

5- Gemfile : les informations quant aux versions des gems que nous avons utilisées et que vous devrez télécharger pour y avoir accès

6- .gitignore ?

7- .env : pour sécuriser les accès aux comptes gmail et twitter


Guide d'utilisation du programme :

1- télécharger le dossier zip : Hacking_Mairies.zip
2- Télécharger et installer le Gemfile
3- Se rendre sur le dossier 3 : et 
4- Se rendre sur le fichier 4 : bot twitter pour .. 


Résumé ou #nos accomplissements :

Grâce à ce programme nous avons envoyé un email personnalisé à ... mairies dans 3 départements différents.
L'objectif était de présenter brièvement le programme et la pédagogie de THP (principalement du peer learning) pour que celles-ci puissent contacter Charles si elles sont intéressées. Le faire à travers un programme designé par ses élèves au bout de 2 semaines montre la pertinence de THP.
Pour être sur que celles-ci lisent ces emails, nous avons également développé un bot twitter pour les relancer et les pousser à s'intéresser à THP.
