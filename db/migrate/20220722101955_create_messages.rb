class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :comment, null: false
      t.string :ingredients
      t.integer :quantity
      t.boolean :preservation
      t.datetime :expiry
      t.references :store, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
