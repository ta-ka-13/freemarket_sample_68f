class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :description, null: false
      t.string :condition, null: false
      t.string :shopping_charges, null: false
      t.string :shopping_area, null: false
      t.string :shopping_date, null: false
      t.integer :buyer
      t.references :user, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
