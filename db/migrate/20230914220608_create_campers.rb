class CreateCampers < ActiveRecord::Migration[7.0]
  def change
    create_table :campers do |t|
      t.string :name
      t.string :aka
      t.string :project
      t.string :project_description
      t.string :project_status
      t.string :project_url
      t.text :stats, array: true

      t.timestamps
    end
  end
end
