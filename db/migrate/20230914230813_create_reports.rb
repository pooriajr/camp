class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :camper, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
