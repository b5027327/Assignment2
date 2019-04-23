class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.date :date
      t.text :address
      t.string :city
      t.string :county
      t.binary :photo
      t.integer :profile_id

      t.timestamps
    end
  end
end
