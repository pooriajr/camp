# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

campers = YAML.load_file("campers.yml")
campers.each do |camper|
   Camper.create({
    name: camper["name"],
    aka: camper["aka"],
    project: camper["project"],
    project_description: camper["project description"],
    project_status: camper["project status"],
    project_url: camper["project url"],
    stats: camper["stats"]
  })
end
