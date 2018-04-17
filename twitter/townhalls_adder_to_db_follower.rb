require "google_drive"
require 'rubygems'
require 'open-uri'
require 'twitter'
require 'nokogiri'
require 'watir'
require 'json'
require 'csv'
require 'dotenv' #je require dotenv pour pouvoir sécuriser le mdp
Dotenv.load

client = Twitter::REST::Client.new do |config|
  ENV['CONSUMER_KEY']
  ENV['CONSUMER_SECRET']
  ENV['TOKEN']
  ENV['TOKEN_SECRET']
end


my_file = "../database/annuaire.csv"
annuaire_data = []


session = GoogleDrive::Session.from_config("../config.json")
$ws = session.spreadsheet_by_key("1yJXy46n2xjgZwcp0ncYMrWwovtO3GMFG2UsKEMJZfkU").worksheets[0]


CSV.foreach(my_file, headers: false) do |row|
  annuaire_data << row[1]
end

#METHODE QUI PERMET DE RECUPERER TOUS LES NOMS TWITTER DES COMPTES DE MAIRIES (OU PRESQUE...) QUI SONT DANS NOTRE FICHIER CSV

SEARCH_TERMS = annuaire_data
#SEARCH_TERMS.map! {|ville| ville.gsub(/\s+/, "")} #la recherche est légèrement différente si dans notre barre de recherche on tape "aulnaisousbois" plutôt que "aulnais sous bois"

urls=[]
i=0
for i in 0..SEARCH_TERMS.length-1 do
	if client.user_search(SEARCH_TERMS[i]).empty? == false
	ensemble_de_users = client.user_search(SEARCH_TERMS[i]) #on fait une recherche avec chaque nom de ville
	urls << ensemble_de_users[0].uri.to_s #la recherche prend, grâce à l'index 0, le premier résultat de la recherche (donc le plus pertinent)
	i=i+1
	else
	urls << "Pas de compte Twitter"
	i=i+1 
	end
end

handle_twitter = urls.map! {|url| url.gsub("https://twitter.com/", "")} #on isole les handle twitter depuis les urls


=begin

#METHODE QUI PERMET DE METTRE LES NOMS TWITTER A LA SUITE DANS NOTRE FICHIER GOOGLE DRIVE:
def google_drive(array)

	i = 0
	for i in 0..array.length-1 do 
		$ws[i+1, 4]=array[i]
		i += 1
		$ws.save
	end

end

google_drive(handle_twitter)

=end


#COMMANDE POUR FOLLOW TOUS LES COMPTES TWITTER DE MAIRIES IDENTIFIEES:
client.follow(handle_twitter)

