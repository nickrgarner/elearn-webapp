class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :description
      t.references :student
      t.references :teacher
      t.references :course_section
      t.timestamps
    end
  end
end
