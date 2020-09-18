class CreateCartObjects < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_objects do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :course_section, null: false, foreign_key: true
      t.timestamps
    end
  end
end
