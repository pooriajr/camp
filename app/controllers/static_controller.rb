class StaticController < ApplicationController
  def index
    # get campers from yaml
    @campers = YAML.load_file('campers.yml')
  end
end
