class CampersController < ApplicationController
  before_action :set_camper, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @camper.aka = nil if @camper.aka == ""
    respond_to do |format|
      if @camper.update(camper_params)
        format.html { redirect_to camper_url(@camper), notice: "Camper was successfully updated." }
        format.json { render :show, status: :ok, location: @camper }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @camper.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def camper_params
    params.require(:camper).permit(:name, :aka, :project, :project_description, :project_url, :project_status)
  end

  def set_camper
    @camper = Camper.find(params[:id])
  end
end
