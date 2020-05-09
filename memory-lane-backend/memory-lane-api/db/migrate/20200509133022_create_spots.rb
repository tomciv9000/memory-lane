class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :location
      t.references :memory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
