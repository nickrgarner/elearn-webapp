class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :coursenumber
      t.string :name
      t.string :area
      t.float :price

      t.timestamps
    end
  end
end
