class CreateIwatches < ActiveRecord::Migration[5.2]
  def change
    create_table :iwatches do |t|
      t.string :author
      t.float :rating
      t.text :review
      t.date :date
      t.integer :iwatch_id
      t.integer :profile_id
      t.integer :product_id

      t.timestamps
    end
  end
end
