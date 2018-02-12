class User
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select{|rc| rc.user == self}.map{|rc| rc.recipe}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select{|al| al.user == self}
  end

  def top_three_recipes
    RecipeCard.all.select{|rc| recipes.include?(rc.recipe)}.max(3)
  end

  def most_recent_recipe # return rc with greatest date from user_recipe_cards array
    RecipeCard.all.select{|rc| rc.user == self}.sort{|a,b| a.date <=> b.date}.last
  end

  def safe_recipes
    unsafe_ingredients = self.allergens.map{|allergen| allergen.ingredient}
    Recipe.all.reject do |recipe|
      (recipe.ingredients - unsafe_ingredients).count < recipe.ingredients.count
    end
  end

end
