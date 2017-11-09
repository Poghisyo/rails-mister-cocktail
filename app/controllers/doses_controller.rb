class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    # @dose.cocktail_id = params[:dose][:cocktail_id].to_i

    @dose.cocktail = @cocktail #params[:dose][:cocktail_id].to_i
    # p @dose

    if @dose.save
      # p @cocktail
      # @cocktail = Cocktail.where(@dose.cocktail_id == @cocktail.id)
      redirect_to cocktail_path(@cocktail)
    else
      render :new #'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    # redirect_to
  end


  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
