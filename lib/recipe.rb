class Recipe
  attr_reader :name, :description, :done, :prep_time, :rating
  
  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @done = attributes[:done] || 0
    @prep_time = attributes[:prep_time]
    @rating = attributes[:rating]
  end

  def done!
    @done = 1
  end
end

# Recipe.new("Chocolate", "Description")

