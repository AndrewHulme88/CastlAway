# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  if user.save
    puts "User created with email: #{user.email}"
  else
    puts "Error creating user: #{user.errors.full_messages}"
  end
end

Castle.create(
  name: "Chateau de Vitry-la-Ville",
  location: "Champagne, France",
  price: 3000,
  description: "Château-de-Vitry-la-Ville, one of the most unique dwellings in Champagne, made of stone and limestone and crowned by violet, Irish slate roofs.",
  rating: 4,
  user_id: 1
)

Castle.create(
  name: "Birkhill Castle",
  location: "Fife, Scotland",
  price: 1500,
  description: "Located in the Kingdom of Fife, overlooking the Firth of Tay, Birkhill castle is the ancestral home of the Earls of Dundee, the Royal Standard Bearers of Scotland. Although the family have all now moved out, the history of the castle remains firmly in place.",
  rating: 3,
  user_id: 2
)

Castle.create(
  name: "BlackWater Castle",
  location: "Ireland",
  price: 2500,
  description: "A medieval Castle for rent in Ireland, the spectacular home of the former Viscount of Fermoy and Lords of the Barony of Fermoy, is a truly unique heritage site of international significance. Blackwater Castle, with a history extending back to the Mesolithic period, is available to hire as a private Castle experience for exclusive Castle weddings, private parties, and family gatherings.",
  rating: 4,
  user_id: 3
)

Castle.create(
  name: "Hogwarts Castle",
  location: "Highlands, Scotland, Great Britian",
  price: 5000,
  description: "A large, seven-storey high building supported by magic, with a hundred and forty-two staircases throughout its many towers and turrets and very deep dungeons. The castle was built in the late Early Middle Ages (c. 993) by a wizard architect and the four most celebrated wizards of the age: Godric Gryffindor, Helga Hufflepuff, Rowena Ravenclaw and Salazar Slytherin. The castle was the main building of Hogwarts School of Witchcraft and Wizardry, regarded as the finest wizarding school in the world.",
  rating: 5,
  user_id: 4
)

Castle.create(
  name: "Frozen Combo 6x5",
  location: "Bayswater, Melbourne",
  price: 250,
  description: "Get ready to bring the magic of Frozen to life with a jumping castle that includes a slide! This Frozen-themed inflatable play area is the perfect way to create an unforgettable experience for kids. Covered with colorful images of beloved characters like Elsa, Anna, and Olaf, this jumping castle is sure to delight kids of all ages.",
  rating: 2,
  user_id: 5
)
