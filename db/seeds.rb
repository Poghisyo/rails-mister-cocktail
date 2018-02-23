require 'open-uri'
require 'json'
require 'faker'

puts "destroying previous data"

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

puts "planting the seeds"

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
attr_serialized = open(url).string
attributes = JSON.parse(attr_serialized)

attributes['drinks'].each do | ing|
  # p ing
  Ingredient.create!(name: ing.values[0])
end

ingredients = Ingredient.all
20.times do
  Cocktail.create!(name: Faker::OnePiece.island)
end



puts "done"
