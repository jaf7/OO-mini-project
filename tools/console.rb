require_relative '../config/environment.rb'

salmon = Recipe.new("Salmon")
chicken = Recipe.new("Chicken Fried Rice")
pizza = Recipe.new("Pepperoni Pizza")
spaghetti = Recipe.new("Spaghetti")
mousse = Recipe.new("Mousse")
tacos = Recipe.new("Tacos")

ryan = User.new("Ryan")
vic = User.new("Vick")
sof = User.new("Sofia")
anthony = User.new("Anthony")

# card1 = RecipeCard.new(ryan, salmon, 2000, 5)
# card2 = RecipeCard.new(ryan, pizza, 2001, 4)
# card3 = RecipeCard.new(sof, salmon, 2002, 3)
# card4 = RecipeCard.new(anthony, chicken, 2003, 2)

sugar = Ingredient.new("sugar")
salt = Ingredient.new("salt")
cinnamon = Ingredient.new("cinnamon")
peanuts = Ingredient.new("peanuts")
milk = Ingredient.new("milk")
gluten = Ingredient.new("gluten")

ryan.add_recipe_card(salmon, 2000, 5)
ryan.add_recipe_card(chicken, 2001, 4)
ryan.add_recipe_card(pizza, 2002, 4)
vic.add_recipe_card(spaghetti, 2002, 3)
vic.add_recipe_card(mousse, 2001, 5)
vic.add_recipe_card(tacos, 2005, 4)

ryan.declare_allergen(gluten)
ryan.declare_allergen(sugar)
vic.declare_allergen(gluten)
sof.declare_allergen(gluten)
anthony.declare_allergen(peanuts)

ryan.add_recipe_card(tacos, 2012, 4)
sof.add_recipe_card(spaghetti, 2014, 5)
vic.add_recipe_card(spaghetti, 2013, 5)
anthony.add_recipe_card(spaghetti, 2015, 2)

tacos.add_ingredients([sugar,salt,cinnamon,peanuts])
mousse.add_ingredients([sugar,salt,peanuts])
spaghetti.add_ingredients([milk,salt])
pizza.add_ingredients([salt,cinnamon,peanuts,milk])
chicken.add_ingredients([gluten])


binding.pry
