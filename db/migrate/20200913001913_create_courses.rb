class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.integer :course_number
      t.string :name
      t.string :area
      t.float :price
      t.references :discipline
      t.timestamps
    end
  end
end
