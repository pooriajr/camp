class StaticController < ApplicationController
  def index
    # get campers from yaml
    @campers = Camper.all
  end
end
