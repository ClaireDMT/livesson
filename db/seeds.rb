# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning Lessons"
Lesson.destroy_all
puts "Cleaning Activities"
Activity.destroy_all
puts "Cleaning Sports"
Sport.destroy_all
puts "Cleaning Users"
User.destroy_all
puts "Cleaning Eleves"
Eleve.destroy_all

puts "Création d'une activité"
Activity.create!(activity_name: 'Sport')

puts "Création des sports"
possible_sports = [
  "Yoga",
  "Pilates",
  "Cross-fit",
  "Danse",
  "Musculation",
  "Réathlétisation"
]
possible_sports.each do |sport|
  Sport.create!(sport_name: sport)
end

puts "Création des Users"
marine = User.create!(email: "marine@sourin.com", password: "marinesourin", password_confirmation: "marinesourin", admin: true, confirmed_at: DateTime.now)
guitou = User.create!(email: "guitou@imary.com", password: "guitouimary", password_confirmation: "guitouimary", prof: true, confirmed_at: DateTime.now)

puts "Création des Eleves/Profs"
Eleve.create!(name: "Marine",
             surname: "Sourin",
             birthdate: "07/05/1995",
             prof: marine[:prof],
             sex: "Femme",
             phone_number: "0688000760",
             country: "France",
             city: "Paris",
             status: "Inscrit(e)",
             user_id: marine.id)

guitou_eleve = Eleve.create!(name: "Guitou",
             surname: "Imary",
             birthdate: "15/10/1990",
             prof: guitou[:prof],
             sex: "Homme",
             phone_number: "0634762386",
             country: "France",
             city: "Paris",
             status: "Inscrit(e)",
             presentation: "Ceci est ma présentation en temps que prof",
             facebook: "https://www.facebook.com/guitou.imary",
             twitter: "https://www.twitter.fr",
             instagram: "https://www.instagram.com/guitouchou/",
             siret_number: "ABC123",
             company_address: "53 rue de Rome",
             iban: "AZERTY123456",
             bic: "AZE123",
             moderated: true,
             user_id: guitou.id)

puts "Création des Lessons"
Lesson.create!(lesson_date: "23/06/2020",
              beginning_time: "4:00pm",
              end_time: "5:00pm",
              lesson_description: "Ceci est la description du cours",
              lesson_material_needed: "Vous aurez besoin de ce matériel",
              lesson_name: "Ceci est le cours",
              lesson_level: "Débutant",
              lesson_duration: "1:00",
              lesson_language: "Français",
              lesson_price: 15,
              sport_id: Sport.first.id,
              activity_id: Activity.first.id,
              eleve_id: guitou_eleve.id)






