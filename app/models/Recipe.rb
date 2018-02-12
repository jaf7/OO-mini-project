class Recipe
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
      self.all.each_with_object(Hash.new(0)) do |recipe, hash|
        current_recipe_count = RecipeCard.all.select{|rc| rc.recipe == recipe}.count
        hash[recipe] = current_recipe_count
      end.max_by { |k, v| v }.first
      # max_by returns an array. given a block that checks against value, returns array of [key, value]
      # we need the key (the recipe instance)
  end

  def users
    RecipeCard.all.select{|rc| rc.recipe == self}.map{|rc| rc.user}
  end

  def ingredients
    RecipeIngredient.all.select{|ri| ri.recipe == self}.map{|ri| ri.ingredient}
  end

  def allergens
    Allergen.all.select{|al| self.all.include?(al.ingredient)}
  end

  def add_ingredients(ingredients)
    ingredients.each{|ingredient| RecipeIngredient.new(self, ingredient)}
  end


end
