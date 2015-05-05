class AddDefaultStatusToTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :status
    add_column :tasks, :status, :string, default: 'incomplete'
  end
end
