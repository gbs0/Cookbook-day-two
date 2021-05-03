require_relative 'recipe'
require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display(@cookbook.all)
    
  end

  def create
    name = @view.ask_for("Recipe name?")               # 1. Nome da receita
    description = @view.ask_for("Recipe Description?") # 2. Descrição da receita
    recipe = Recipe.new(name, description)  # 3. Criar um Recipe.new
    @cookbook.add_recipe(recipe)            # 4. Adicionar recipe no Cookbook
    list
  end

  def destroy
    @view.display(list)
    index = @view.ask_for("What's the recipe index?").to_i # 1. Perguntar ao user qual receita deletar (index)
    @cookbook.remove_recipe((index - 1))    # 2. Deletar a receita escolhida
    list  # 3
  end
end