PROJET : ENVOIS D'EMAIL EN MASSE

------- à l'attention des correcteurs -----------

Nous avons réussi tous nos programme mais nous rencontrons un gros problème lors de l'upload sur github en ce qui concere nos fichiers .env et json.
Nous vous demandons d'en prendre note pour la correction et pour tester les programmes, veuillez modifier notre fichier json et créer des .env dans les dossier twitter et mailer car nos clés ne sont pas actives..
Merci beaucoup pour votre aide et vos conseils avisés pour l'upload github.
Cordialement,
L'équipe des courgettes.

------------------------------------------------

Ce projet consiste à scrapper les adresses email des mairies du 3 départements (44, 95.. ) avant de leur envoyer un email pour présenter les atouts de THP.


Réalisé par Team Courgette composée de : 
- Ana Zegheanu
- Tatijana Rajcic
- Olivier Dumas
- Richard Jackson
- Paul Aguadisch


Arborescence du projet :

1- Dossier Scrapper : Scrapping des adresses mail des mairies
- dossier: townhalls_scrapper.rb
permet de scrapper les infos des mairies du 44, 93, 94

2- Dossier Database : contient les informations relatives aux mairies par département
- fichier annuaire.csv : résultat du programme de scrapping pour récupérer les emails des mairies

3- Dossier Mailer : regroupant les départements, les noms des villes et les adresses emails correspondantes
- fichier townhall_mailer.rb : programme pour envoyer des emails à toutes les mairies


4- Dossier Twitter : Programme d'envoi d'emails à ces mairies
- fichier townhalls_adder_to_db_follower --> Bot twitter permettant de follow les mairies et ajouter leurs infos dans un google drive spreadsheet.

5- Readme.md : guide explicatif de notre projet

6- Gemfile : les informations quant aux versions des gems que nous avons utilisées et que vous devrez télécharger pour y avoir accès.

7- .gitignore: permet de sécuriser nos fichier .env lors de l'envoi en ligne

Guide d'utilisation du programme :

1- télécharger le dossier zip : Hacking_Mairies.zip
2- Ajouter les .env et modifier le json qui ne marchent pas ici
3 - exécuter les programmes en commeçant par le scrapper puis le mailer puis twitter


Résumé ou #nos accomplissements :

Grâce à ce programme nous avons envoyé un email personnalisé à 308 mairies dans 3 départements différents.
L'objectif était de présenter brièvement le programme et la pédagogie de THP (principalement du peer learning) pour que celles-ci puissent contacter Charles si elles sont intéressées. Le faire à travers un programme designé par ses élèves au bout de 2 semaines montre la pertinence de THP.
Pour être sur que celles-ci lisent ces emails, nous avons également développé un bot twitter pour les relancer et les pousser à s'intéresser à THP.

Merci beaucoup pour la correction.

L'équipe courgette
