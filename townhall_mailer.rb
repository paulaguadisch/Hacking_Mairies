require 'rubygems'
require 'open-uri'
require 'google_drive'
require 'gmail'
require 'csv' #je require csv pour pouvoir utiliser le fichier csv
require 'dotenv' #je require dotenv pour pouvoir sécuriser le mdp
Dotenv.load



def send_email_to_line

array_emails = [] #création d'un tableau vide pour y stocker les emails du csv
array_nom_des_mairies = [] #création d'un second tableau pour y stocker les noms des mairies
voyelles = ["a","e","i","o","u","y","A","E","I","O","U","Y"] #Je définis un tableau de voyelles pour pouvoir personnaliser le mail avec d' ou de selon si la mairie commence par une consonne ou une voyelle
determinant = "" #je crée une variable vide à laquelle je vais donner une valeur dans mon "if" plus bas selon si la ville commence par une voyelle ou une consonne

CSV.foreach("annuaire.csv") { |row| array_emails << row[1] } #je place le contenu de la colonne 1 (2e colonne) du csv dans ce tableau
CSV.foreach("annuaire.csv") { |row| array_nom_des_mairies << row[0] } #je place le contenu de la colonne 0 (1ère colonne) du csv dans ce tableau


	Gmail.connect(ENV['EMAIL'], ENV['MDP']) do |gmail| #je me connecte à mon compte gmail

	y = 0
	array_emails.each do |i| #pour chaque éléments de mon tableau des emails
			email = gmail.compose do 
			  to i #je sélectionne un élément de mon tableau d'emails
			  subject "Présentation de The Hacking Project" 
			  content_type 'text/html; charset=UTF-8' #je précise que le content est du html et peut inclure les caractères spéciaux avec le charset UTF-8
			  city = array_nom_des_mairies[y] #je sélectionne la ville qui passe dans ma boucle each et la stocke dans city
			  split_letters = city.split("") #je split le nom de ma ville en lettres
				  if voyelles.include?(split_letters[0]) #Si la première lettre de split_letter est présente dans le tableau voyelles alors on met "d'", sinon on met "de"
				  	determinant = "d'"
				  else
				  	determinant = "de "
				  end
			  body "<p>Bonjour, </p>
				<p>Je m'appelle Olivier, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. <br/>
				La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. <br/>
				Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.</p>

				<p>Déjà 300 personnes sont passées par The Hacking Project. Est-ce que la mairie #{determinant}#{array_nom_des_mairies[y]} veut changer le monde avec nous ?</p>

				<p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"

			y += 1 #je rajoute +1 à y afin de modifier le nom de la Mairie qui apparaitra dans le mail et de passer à l'élément suivant du tableau array_nom_des_mairies
			end
			email.deliver! #j'envoie l'email
		end
	end
end

send_email_to_line 
