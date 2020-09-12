class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.text :address
      t.string :password_digest
      t.string :user_type

      t.timestamps
    end
    add_index :profiles, :email, unique: true
  end
end
