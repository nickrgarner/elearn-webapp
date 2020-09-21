class AddIsDeletedToTeacher < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :is_deleted, :boolean, default: false
  end
end
