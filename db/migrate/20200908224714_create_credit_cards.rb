class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.integer :card_number
      t.date :expiration_date
      t.integer :cvv
      t.references :student
      t.timestamps
    end
  end
end
