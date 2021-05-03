require_relative 'recipe'
require_relative 'view'
require_relative 'scraper'
require 'pry'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @scraper = Scraper.new
  end

  def list
    @view.display(@cookbook.all)
    
  end

  def create
    name = @view.ask_for("Recipe name?")               # 1. Nome da receita
    description = @view.ask_for("Recipe Description?") # 2. Descrição da receita
    prep_time = @view.ask_for("Recipe Prep Time?")
    rating = @view.ask_for("Which Rating?")
    attr = {name: name, description: description, rating: rating.to_i, prep_time: prep_time.to_i}
    @cookbook.add_recipe(Recipe.new(attr))            # 4. Adicionar recipe no Cookbook
    list
  end

  def destroy
    @view.display(list)
    index = @view.ask_for("What's the recipe index?").to_i # 1. Perguntar ao user qual receita deletar (index)
    @cookbook.remove_recipe((index - 1))    # 2. Deletar a receita escolhida
    list  # 3
  end

  def import
    ingredient = @view.ask_for("What ingredient would you like a recipe for?") # 1. Perguntar ao user, qual o Ingrediente desejado
    results = @scraper.search(ingredient)                                      # 2. Fazer o Fetch das receitas online
    @view.display(results)                                                     # 3. Mostrar as receitas buscadas
    index = @view.ask_for("Which recipe would you like to import? (enter index)") # 4. Perguntar qual receita importar
    recipe = results[(index.to_i) - 1]                                         # 5. Escolher qual receita importart
    @cookbook.add_recipe(recipe)                                              # 6. Adicionar receita escolhida no cookbook
  end

  def mark_as_done
    list
    index = @view.ask_for("Which index you like to mark as done?")
    @cookbook.mark_as_done(index.to_i)
    list
  end
end