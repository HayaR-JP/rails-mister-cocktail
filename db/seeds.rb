require "open-uri"
require "json"

puts "Cleaning database..."
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

puts "Fetching ingredients from API..."

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# Open the URL and read the JSON content
json = URI.open(url).read
# Parse the JSON into Ruby objects
data = JSON.parse(json)
# Iterate over the list of ingredients
data["drinks"].each do |drink|
  # For each ingredient, create a new record in your database
  Ingredient.create!(name: drink["strIngredient1"])
end

puts "Finished! Created #{Ingredient.count} ingredients."
