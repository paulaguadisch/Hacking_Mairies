PROJET : ENVOIS D'EMAIL EN MASSE

------- à l'attention des correcteurs -----------

Nous avons réussi tous nos programme mais nous rencontrons un gros problème lors de l'upload sur github en ce qui concere nos fichiers .env et json.
Nous vous demandons d'en prendre note pour la correction et pour tester les programmes, veuillez modifier notre fichier json et créer des .env dans les dossier twitter et mailer car nos clés ne sont pas actives..
Merci beaucoup pour votre aide et vos conseils avisés pour l'upload github.
Cordialement,
L'équipe des courgettes.

------------------------------------------------

Ce projet consiste à scrapper les adresses email des mairies du 3 départements (44, 93 et 94) avant de leur envoyer un email pour présenter les atouts de THP.


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

La méthode get_all_information_on_3_townhalls permet de réunir toutes les informations sur ces 3 départements (et toutes leurs mairies) dans un array de arrays (que l'on appelle tableau_global). 
La méthode go_through_each_element_of_array va permettre d'exporter ces infos dans un GoogleDrive, dans 3 colonnes différentes.
La méthode save_the_file va permettre de sauvegarder ces informations dans notre annuaire csv i.e. à chaque fois que l'on relance notre fichier ruby, notre database est updatée.
/!\ POUR QUE CE FICHIER MARCHE, IL FAUT QUE LE FICHIER CONFIG.JSON SOIT REMPLI.
Cela vous permettra de visualiser le résultat de notre export dans ce fichier GoogleDrive dont voici le lien: https://docs.google.com/spreadsheets/d/1yJXy46n2xjgZwcp0ncYMrWwovtO3GMFG2UsKEMJZfkU/edit?usp=sharing
Sinon, mettez en commentaire notre méthode go_through_each_element_of_array et regardez 1) le résultat de notre méthode get_all_information_on_3_townhalls directement dans la console en remplaçant return par print, ou 2) armez vous de patience et attendez l'output CSV grâce à la méthode save_the_file. Notre database "annuaire" existant déjà, cette opération ne fera que l'updater, mais vous pourrez voir comment le fichier est généré.

2- Dossier Database : contient les informations relatives aux mairies par département
- fichier annuaire.csv : résultat du programme de scrapping pour récupérer les emails des mairies

3- Dossier Mailer : regroupant les départements, les noms des villes et les adresses emails correspondantes
- fichier townhall_mailer.rb : programme pour envoyer des emails à toutes les mairies
/!\ POUR QUE CE FICHIER MARCHE, IL FAUT QUE VOUS RENTRIEZ DES IDENFIANTS GMAIL. 
Si vous voulez vous amusez à envoyer des mails à tout le monde depuis cette adresse (qui est donc la vôtre), pensez à modifier le prénom dans le mail (qui est pour l'instant celui d'Olivier!)

4- Dossier Twitter : Programme d'envoi d'emails à ces mairies
- fichier townhalls_adder_to_db_follower --> Bot twitter permettant de follow les mairies et ajouter leurs infos dans un google drive spreadsheet.
/!\ POUR QUE CE FICHIER MARCHE, IL FAUT INDIQUER DES IDENFIANTS TWITTER ET IL FAUT QUE LE FICHIER CONFIG.JSON SOIT REMPLI.
Ce que fait ce fichier est, pour une mairie donnée (ex. Aubervilliers), rechercher le compte Twitter associé le plus pertinent (= c'est ce dont s'occupe la fonction client.user_search) en fonction du mot clé que l'on a tapé (en l'occurence ici les noms des mairies). Pas mal de comptes Twitter ne sont pas pertinents, simplement parce que les mairies en question n'ont pas de compte Twitter! Handle_twitter regroupe tous les users Twitter identifiés. 
La méthode google_drive (pour l'instant mise en commentaire pour éviter de faire buguer vos ordis: vous avez juste à enlever le =begin et =end pour voir la 4è colonne de la spreadsheet s'updater) permet de rajouter cette dernière information à celles déjà collectées. Nous n'avons pas réussi à faire de sauvegarde CSV nous permettant d'ajouter cette 4e colonne à notre fichier annuaire.csv, si quelqu'un a des pistes nous sommes preneurs.
La dernière ligne de code va permettre de suivre tous les comptes Twitter identifiés. 


5- Readme.md : guide explicatif de notre projet

6- Gemfile : les informations quant aux versions des gems que nous avons utilisées et que vous devrez télécharger pour y avoir accès.

7- .gitignore: permet de sécuriser nos fichier .env lors de l'envoi en ligne

Guide d'utilisation du programme :

1- télécharger le dossier zip : Hacking_Mairies.zip
2- Remplacer les .env et modifier le json qui ne marchent pas ici
3 - exécuter les programmes en commençant par le scrapper puis le mailer puis twitter


Résumé ou #nos accomplissements :

Grâce à ce programme nous avons envoyé un email personnalisé à 308 mairies dans 3 départements différents.
L'objectif était de présenter brièvement le programme et la pédagogie de THP (principalement du peer learning) pour que celles-ci puissent contacter Charles si elles sont intéressées. Le faire à travers un programme designé par ses élèves au bout de 2 semaines montre la pertinence de THP.
Pour être sur que celles-ci lisent ces emails, nous avons également développé un bot twitter pour les relancer et les pousser à s'intéresser à THP.

Merci beaucoup pour la correction.

L'équipe courgette
