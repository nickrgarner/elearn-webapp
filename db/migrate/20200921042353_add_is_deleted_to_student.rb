class AddIsDeletedToStudent < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :is_deleted, :boolean, default: false
  end
end
