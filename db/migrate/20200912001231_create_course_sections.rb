class CreateCourseSections < ActiveRecord::Migration[5.1]
  def change
    create_table :course_sections do |t|
      t.references :course
      t.references :teacher
      t.timestamps
    end
  end
end
