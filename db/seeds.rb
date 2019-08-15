require 'open-uri'
require 'json'
require 'faker'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

Cocktail.destroy_all
Dose.delete_all
Ingredient.delete_all

puts "Create new ingredients"

all_ingredients = []

ingredients["drinks"].each do |ingredient|
  ingredient_name = ingredient["strIngredient1"]
  ingredient_picture = "http://www.thecocktaildb.com/images/ingredients/#{ingredient_name}-Small.png"
  all_ingredients << Ingredient.create!(name: ingredient_name, photo: ingredient_picture)
end

puts "Create 20 cocktails"

20.times do
  cocktail = Cocktail.create(name: Faker::Movies::HarryPotter.character)
  rand(3..6).times do
    Dose.create(description: "#{rand(1..15)} ml", ingredient: all_ingredients.sample, cocktail: cocktail)
  end
end
