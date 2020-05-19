require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning Reviews"
Review.destroy_all
puts "Cleaning Bookings"
Booking.destroy_all
puts "Cleaning Lessons"
Lesson.destroy_all
puts "Cleaning Templates"
Template.destroy_all
puts "Cleaning Activities"
Activity.destroy_all
puts "Cleaning Users"
User.destroy_all
puts "Cleaning Eleves"
Eleve.destroy_all
puts "Cleaning Sports"
Sport.destroy_all

puts "Création d'une activité"
Activity.create!(activity_name: 'Sport')

puts "Création des sports"
possible_sports = [
  "Danse",
  "Yoga",
  "Barre",
  "Gym / Pilate",
  "Cardio training",
  "Renforcement",
  "Méditation",
  "Stretching",
  "Sports de combat",
  "Spécial kids"
]
possible_sports.each do |sport|
  Sport.create!(sport_name: sport)
end

puts "Création des Users"
marine = User.create!(email: "marine@sourin.com", password: "marinesourin", password_confirmation: "marinesourin", prof: true, admin: true, confirmed_at: DateTime.now)
guitou = User.create!(email: "guitou@imary.com", password: "guitouimary", password_confirmation: "guitouimary", prof: true, confirmed_at: DateTime.now)
claire = User.create!(email: "claire@demont.com", password: "clairedemont", password_confirmation: "clairedemont", prof: false, confirmed_at: DateTime.now)

puts "Création des Eleves/Profs"
marine_eleve = Eleve.create!(name: "Marine",
             surname: "Sourin",
             birthdate: "07/05/1995",
             prof: marine[:prof],
             sex: "Femme",
             phone_number: "0688000760",
             country: "France",
             city: "Paris",
             status: "Inscrit(e)",
             presentation: "J’ai sillonné de nombreux pays, et c’est à travers le monde que j’ai découvert le yoga. Plus de dix ans à le pratiquer sous diverses formes au Canada, en Islande, au Panama, aux Antilles et en France, m’ont menée à prendre une décision qui a changé ma vie : devenir professeur de yoga. Alors tout s’est enchaîné : j’ai obtenu un certificat de professeur de Hatha Yoga en 2015, un autre de spécialisation pour enseigner aux enfants en 2016, et un dernier pour enseigner aux mères enceintes en 2017. J’enseigne désormais le yoga depuis plusieurs années avec passion et dévouement.",
             facebook: "https://www.facebook.com/guitou.imary",
             instagram: "https://www.instagram.com/guitouchou/",
             siret_number: "ABC123",
             company_address: "53 rue de Rome",
             iban: "AZERTY123456",
             bic: "AZE123",
             moderated: true,
             user_id: marine.id,
             sport_id: Sport.last.id)

guitou_eleve = Eleve.create!(name: "Guitou",
             surname: "Imary",
             birthdate: "15/10/1990",
             prof: guitou[:prof],
             sex: "Homme",
             phone_number: "0634762386",
             country: "France",
             city: "Paris",
             status: "Inscrit(e)",
             presentation: "J’ai sillonné de nombreux pays, et c’est à travers le monde que j’ai découvert le yoga. Plus de dix ans à le pratiquer sous diverses formes au Canada, en Islande, au Panama, aux Antilles et en France, m’ont menée à prendre une décision qui a changé ma vie : devenir professeur de yoga. Alors tout s’est enchaîné : j’ai obtenu un certificat de professeur de Hatha Yoga en 2015, un autre de spécialisation pour enseigner aux enfants en 2016, et un dernier pour enseigner aux mères enceintes en 2017. J’enseigne désormais le yoga depuis plusieurs années avec passion et dévouement.",
             facebook: "https://www.facebook.com/guitou.imary",
             instagram: "https://www.instagram.com/guitouchou/",
             siret_number: "ABC123",
             company_address: "53 rue de Rome",
             iban: "AZERTY123456",
             bic: "AZE123",
             moderated: true,
             user_id: guitou.id,
             sport_id: Sport.first.id)

claire_eleve = Eleve.create!(name: "Claire",
             surname: "Demont",
             birthdate: "16/05/1990",
             prof: claire[:prof],
             sex: "Femme",
             phone_number: "0679396645",
             country: "Allemagne",
             city: "Berlin",
             status: "Inscrit(e)",
             presentation: "J’ai sillonné de nombreux pays, et c’est à travers le monde que j’ai découvert le yoga. Plus de dix ans à le pratiquer sous diverses formes au Canada, en Islande, au Panama, aux Antilles et en France, m’ont menée à prendre une décision qui a changé ma vie : devenir professeur de yoga. Alors tout s’est enchaîné : j’ai obtenu un certificat de professeur de Hatha Yoga en 2015, un autre de spécialisation pour enseigner aux enfants en 2016, et un dernier pour enseigner aux mères enceintes en 2017. J’enseigne désormais le yoga depuis plusieurs années avec passion et dévouement.",
             facebook: "https://www.facebook.com/clairedemont",
             instagram: "https://www.instagram.com/claireDTM/",
             user_id: claire.id)

puts "Création des templates"
template_one = Template.create!(template_description: "Envie de réveiller vos muscles et de rester tonique ? Le yoga Vinyasa est fait pour vous.",
                 template_material_needed: "Vous aurez besoin d'un tapis de yoga",
                 template_name: "Yoga vinyasa",
                 template_level: "Tous niveaux",
                 sport_id: Sport.find_by(sport_name: "Yoga").id,
                 activity_id: Activity.first.id,
                 eleve_id: guitou_eleve.id)

template_two = Template.create!(template_description: "Le cardio-training rassemble des activités de fitness sollicitant le muscle cardiaque afin de l\'entraîner à l\'effort et ainsi de renforcer les systèmes cardio-vasculaire et cardio-respiratoire.",
                 template_material_needed: "Vous aurez besoin d'un tapis, et c'est tout ! :)",
                 template_name: "Cardio training",
                 template_level: "Débutant",
                 sport_id: Sport.find_by(sport_name: "Cardio training").id,
                 activity_id: Activity.first.id,
                 eleve_id: guitou_eleve.id)

template_three = Template.create!(template_description: "Le pilates, gym pilates ou encore la méthode pilates est une gymnastique douce qui vous permet de travail l’ensemble de votre corps sans mouvements brusques. En effet, en alliant une respiration profonde et des exercices physiques, le pilates est très bon pour votre corps. Inspiré du yoga, de la gymnastique mais aussi de la danse, le pilates se pratique très régulièrement au sol, à l’aide d’un tapis.
Avec le pilates, votre corps travaillera de manière régulière sans choc ou stress pour vos groupes musculaires. La gym pilates est l’une des meilleures méthodes pour vous renforcer musculairement tout en douceur ! Le Pilates, c’est parfait pour un retour en douceur à une activité physique, mais aussi pour améliorer votre condition physique à long terme !",
                 template_material_needed: "Vous aurez besoin d'un tapis, et c'est tout ! :)",
                 template_name: "Pilate Sénior",
                 template_level: "Débutant",
                 sport_id: Sport.find_by(sport_name: "Gym / Pilate").id,
                 activity_id: Activity.first.id,
                 eleve_id: marine_eleve.id)

puts "Création des Lessons"
lesson_1 = Lesson.create!(lesson_date: "23/06/2020",
              start: DateTime.new(2020,6,23,16,0,0,'+02:00'),
              end: DateTime.new(2020,6,23,17,0,0,'+02:00'),
              lesson_description: template_one.template_description,
              lesson_material_needed: template_one.template_material_needed,
              lesson_name: template_one.template_name,
              lesson_level: template_one.template_level,
              lesson_duration: "60",
              lesson_language: "Français",
              lesson_price: 15,
              sport_id: template_one.sport_id,
              activity_id: template_one.activity_id,
              eleve_id: template_one.eleve_id,
              template_id: template_one.id)

lesson_2 = Lesson.create!(lesson_date: "12/07/2020",
              start: DateTime.new(2020,6,15,01,15,0,'+02:00'),
              end: DateTime.new(2020,6,15,02,0,0,'+02:00'),
              lesson_description: template_two.template_description,
              lesson_material_needed: template_two.template_material_needed,
              lesson_name: template_two.template_name,
              lesson_level: template_two.template_level,
              lesson_duration: "60",
              lesson_language: "Anglais",
              lesson_price: 18,
              sport_id: template_two.sport_id,
              activity_id: template_two.activity_id,
              eleve_id: template_two.eleve_id,
              template_id: template_two.id)

lesson_3 = Lesson.create!(lesson_date: "01/05/2020",
              start: DateTime.new(2020,6,1,15,0,0,'+02:00'),
              end: DateTime.new(2020,6,1,16,0,0,'+02:00'),
              lesson_description: template_three.template_description,
              lesson_material_needed: template_three.template_material_needed,
              lesson_name: template_three.template_name,
              lesson_level: template_three.template_level,
              lesson_duration: "60",
              lesson_language: "Anglais",
              lesson_price: 10,
              sport_id: template_three.sport_id,
              activity_id: template_three.activity_id,
              eleve_id: template_three.eleve_id,
              template_id: template_three.id)

lesson_4 = Lesson.create!(lesson_date: "01/05/2020",
              start: DateTime.new(2020,5,1,12,0,0,'+02:00'),
              end: DateTime.new(2020,5,1,13,0,0,'+02:00'),
              lesson_description: template_two.template_description,
              lesson_material_needed: template_two.template_material_needed,
              lesson_name: template_two.template_name,
              lesson_level: template_two.template_level,
              lesson_duration: "60",
              lesson_language: "Anglais",
              lesson_price: 18,
              sport_id: template_two.sport_id,
              activity_id: template_two.activity_id,
              eleve_id: template_two.eleve_id,
              template_id: template_two.id)

puts "Création des bookings"
Booking.create!(eleve_id: marine_eleve.id,
                status: "cancelled",
                canceller_id: template_two.eleve_id,
                refundable: true,
                lesson_id: lesson_2.id)

Booking.create!(eleve_id: guitou_eleve.id,
                lesson_id: lesson_3.id)

Booking.create!(eleve_id: claire_eleve.id,
                lesson_id: lesson_1.id)

Booking.create!(eleve_id: guitou_eleve.id,
                lesson_id: lesson_4.id)

puts "Création des reviews"
Review.create!(content: "Beautiful Sunday class with Guitou. We were just 5 people so attention was given to each of teach of the participants.",
                rating: 4,
                eleve_id: marine_eleve.id,
                lesson_id: lesson_2.id)

Review.create!(content: "Beautiful Sunday class with Guitou. We were just 5 people so attention was given to each of teach of the participants.",
                rating: 4,
                eleve_id: claire_eleve.id,
                lesson_id: lesson_1.id)

Review.create!(content: "Beautiful Sunday class with Guitou. We were just 5 people so attention was given to each of teach of the participants.",
                rating: 5,
                eleve_id: marine_eleve.id,
                lesson_id: lesson_3.id)
