class AddIsDeletedToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :is_deleted, :boolean, default: false
  end
end
