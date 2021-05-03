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

  def mark_as_done(index)
    recipe = @recipes[index - 1]
    recipe.done!
    save
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
    CSV.foreach(@csv, headers: :first_row, header_converters: :symbol) do |row|
      @recipes << Recipe.new({name: row[0], description: row[1], done: row[2].to_i, rating: row[3], prep_time: row[5]})
    end
  end

  def save
    CSV.open(@csv, "wb") do |row|
      row << ["name", "description", "done", "rating", "prep_time"]
      @recipes.each do |recipe|
        row << [recipe.name, recipe.description, recipe.done, recipe.rating, recipe.prep_time]
      end
    end 
  end
end