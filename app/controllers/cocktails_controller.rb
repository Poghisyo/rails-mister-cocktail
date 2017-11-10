class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.all.where(cocktail_id: @cocktail.id)
    # @doses = doses.where(cocktail_id: @cocktail.id)

    @dose = Dose.new

    @ingredients  = Ingredient.all
    # @cocktail = Cocktail.find(params[:id])
    # @dose = Dose.new
    # # @ingredients = Ingredient.where()
    # @ingredients = Ingredient.all #.map do |i|
    # #   i.name
    # # end
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end


end
