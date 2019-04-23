class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :pname
      t.string :brand
      t.float :price
      t.string :category
      t.date :date
      t.text :description
      t.binary :photo
      t.integer :product_id

      t.timestamps
    end
  end
end
