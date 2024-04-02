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
  castle = Castle.new (
    name: Faker::Superhero.name,
    location: Faker::Address.full_address,
    price:
    description:
    rating:
  )
  castle.save
end



# t.string :name
# t.string :location
# t.float :price
# t.text :description
# t.integer :rating


# 100.times do
#   post = Post.new(
#     title: Faker::Commerce.product_name,
#     url: Faker::Internet.url,
#     votes: (0..1000).to_a.sample
#   )
#   post.save
# end
