class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render 'index.json.jbuilder'
  end
  
  def show
    recipe_id = params[:id]
    @recipe = Recipe.find(recipe_id)
    render 'show.json.jbuilder'
  end
end
