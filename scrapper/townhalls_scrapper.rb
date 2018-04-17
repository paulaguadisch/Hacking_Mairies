require "google_drive"
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'csv'


session = GoogleDrive::Session.from_config("../config.json")
$ws = session.spreadsheet_by_key("1yJXy46n2xjgZwcp0ncYMrWwovtO3GMFG2UsKEMJZfkU").worksheets[0]


def get_all_information_on_3_townhalls

	page_accueil = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"))
	#départements_choix_utilisateur = ["44","93","94"] #utilité: on pourrait transformer ça de telle sorte que l'on demande à l'utilisateur quels départements il veut cibler

	départements_sélectionnés = page_accueil.css(".lientxt[title~='44'],.lientxt[title~='93'],.lientxt[title~='94']") #on va chercher sur la page d'accueil les départements que l'on a choisis
	urls_départements_sélectionnés = []
	départements_sélectionnés.each {|x| urls_départements_sélectionnés.push("http://annuaire-des-mairies.com/"+x['href'].to_s)}
	#on récupère les URLS des départements choisis, pour pouvoir accéder à leur page, et le détail de leurs villes
		
	tableau_global=[]
	j=0
	for j in 0..urls_départements_sélectionnés.length-1 do #on rentre, tour à tour, sur la page du 44, du 93 et du 94 par cette itération
	
		page_par_département = Nokogiri::HTML(open(urls_départements_sélectionnés[j])) 
		villes_par_département = page_par_département.css(".lientxt")

		i=0
		for i in 0..villes_par_département.length-1 do 
			tableau_par_ville=[]
			nom_ville = villes_par_département[i].text
			url = "http://annuaire-des-mairies.com" + villes_par_département[i]['href']
			page_email = Nokogiri::HTML(open(url)) #on rentre, tour à tour, sur la page de chacune des villes du département concerné
			email_ville = page_email.css("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text
			tableau_par_ville = [départements_sélectionnés[j].text,nom_ville,email_ville] #pour une ville donnée, on veut avoir les infos [Département, Nom ville, Email ville]
			i=i+1	
			tableau_global.push(tableau_par_ville) #on met tous nos tableaux par ville dans un gros tableau pour ensuite travailler dessus plus facilement	

		end
		j=j+1

	end
	return tableau_global 

end


def go_through_each_element_of_array(array_of_arrays) 

=begin
notre tableau global ressemble à ça: [[1er département, 1ere ville, 1er email], [1er département, 2e ville, 2e email],...
[2e département, 1ere ville, 1er email], [2e département, 2e ville, 2e email],... [3e département, 1ere ville, 1er email],
[3e département, 2e ville, 2e email], ... [3e departement, dernière ville du 3e dép, dernier email du 3e dép]] 
=end

	i = 0
	for i in 0..array_of_arrays.length-1 do #la boucle permet de considérer chaque élément de notre tableau global à savoir à chaque fois chaque "tiercé" département/ville/mail
		$ws[i+1, 1]=array_of_arrays[i][0]
		$ws[i+1, 2]=array_of_arrays[i][1]
		$ws[i+1, 3]=array_of_arrays[i][2]
		i += 1
		$ws.save
	end

end


def save_the_file(array_of_arrays)

	CSV.open("../database/annuaire.csv", "wb+") do |csv|
		array_of_arrays.each do |array|
		   	csv << array
		 end
	end

end


go_through_each_element_of_array(get_all_information_on_3_townhalls)
save_the_file(get_all_information_on_3_townhalls)

