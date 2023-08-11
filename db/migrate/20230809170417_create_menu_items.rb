class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.integer :dish_type
      t.string :allergens
      t.float :price

      t.timestamps
    end
  end
end
