class Api::RecipesController < ApplicationController
  def one_recipe_action
    @recipe = Recipe.last
    render 'one_recipe_view.json.jbuilder'
  end
end
