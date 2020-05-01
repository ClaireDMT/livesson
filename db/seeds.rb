# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Activity.create!(activity_name: 'Sport')

Sport.destroy_all
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

# Lesson.destroy_all
# lesson1 = Lesson.create!(
#   lesson_date: Date.now,
#   beginning_time: Time.now.day + 7,
#   end_time: Time.now.hour + 2,
#   lesson_description: "Ceci est la description de l'évènement",
#   lesson_material_needed: "Vous avez besoin de plusieurs choses",
#   lesson_name: 'Yoga Nidra',
#   lesson_level: 'Tous niveaux',
#   lesson_duration: 45,
#   lesson_language: 'Français',
#   lesson_price: 12,
#   lesson_discount_price: 9)

# lesson2 = Lesson.create!(
#   lesson_date: Date.now,
#   beginning_time: Time.now.day + 8,
#   end_time: Time.now.hour + 2,
#   lesson_description: "Ceci est la description de l'évènement 2",
#   lesson_material_needed: "Vous avez besoin de plusieurs choses 2",
#   lesson_name: 'Yoga Nidra',
#   lesson_level: 'Tous niveaux',
#   lesson_duration: 45,
#   lesson_language: 'Français',
#   lesson_price: 12,
#   lesson_discount_price: 9)
