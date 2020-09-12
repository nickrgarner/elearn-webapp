class CreatePurchaseHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_histories do |t|
      t.references :course_section
      t.references :student
      t.timestamps
    end
  end
end
