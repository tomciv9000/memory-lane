class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.references :spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
