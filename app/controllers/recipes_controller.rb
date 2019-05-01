class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    # @recipe.ingredients.build(name:'')
    # @recipe.ingredients.build(name:'')
    
    
  # <%=f.fields_for :ingredients do |ing|%>
  # <%=ing.label :name%><br>
  # <%=ing.text_field :name%><br>
  # <%=ing.label :quantity%><br>
  # <%=ing.text_field :quantity%><br>
  # <%end%>
    
    
    
  end

  def create
    @recipe = Recipe.create(recipe_params)
   
    redirect_to @recipe
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(
      :title, ingredients_attributes: [
        :id, :name, :quantity
        ]
        )
  end
  
end
