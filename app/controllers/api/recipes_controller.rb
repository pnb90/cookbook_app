class Api::RecipesController < ApplicationController

  def index

    @recipes = Recipe.all

    search_terms = params[:search]
    if search_terms
      @recipes = @recipes.where("title iLIKE ?", "%#{search_terms}%")
    end 

    @recipes = @recipes.order(:id => :asc)

    render 'index.json.jbuilder'
  end
  
  def create
    @recipe = Recipe.new(
                          title: params[:title],
                          chef: params[:chef],
                          ingredients: params[:ingredients],
                          directions: params[:directions],
                          prep_time: params[:prep_time]
                        )
    @recipe.save
    render 'show.json.jbuilder' #since we already have the ability to just see one
  end

  def show
    recipe_id = params[:id]
    @recipe = Recipe.find(recipe_id)
    # render 'show.json.jbuilder'
    render 'show.json.jbuilder'
  end

  def update
    recipe_id = params[:id]
    @recipe = Recipe.find(recipe_id)

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.image_url = params[:image_url] || @recipe.image_url

    @recipe.save
    render 'show.json.jbuilder'
  end

  def destroy
    recipe_id = params[:id]
    recipe = Recipe.find(recipe_id)
    recipe.destroy
    #you don't need instance variables because you are destroying it, and therefore will not need to be passed to the view. 
    render json: {message: "Successfully removed recipe."}
  end
end
