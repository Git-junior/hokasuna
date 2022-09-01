class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :business,    null: false
      t.string :ingredients, null: false, default: ''
      t.string :quantity,    null: false, default: ''
      t.text :comment
      t.references :store,   null: false, foreign_key: true
      t.references :room,    null: false, foreign_key: true 
      t.timestamps
    end
  end
end
