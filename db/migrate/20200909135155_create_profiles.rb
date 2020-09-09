class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :phone_number
      t.string :password_digest

      t.timestamps
    end
    add_index :profiles, :email, unique: true
  end
end
