require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)  
    @recipes = []
    @csv = csv_file_path
    load
  end

  def all
    return @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save
  end

  def load
    CSV.foreach(@csv) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save
    CSV.open(@csv, "wb") do |row|
      @recipes.each do |recipe|
        row << [recipe.name, recipe.description]
      end
    end 
  end
end