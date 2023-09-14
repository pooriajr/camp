class CampersController < ApplicationController
  def show
    @camper = Camper.find(params[:id])
  end

  def edit
  end
end
