class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.string :description
      t.string :people
      t.string :dates
      t.string :photos

      t.timestamps
    end
  end
end
