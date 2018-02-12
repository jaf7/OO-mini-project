class Ingredient
  attr_accessor :name, :recipe

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    self.all.each_with_object(Hash.new(0)) do |ingred, hash|
      current_ingred_count = RecipeIngredient.all.select{|ri| ri.ingredient == ingred}.count
      hash[ingred] = current_ingred_count
    end.max_by { |k, v| v }.first
  end

end
