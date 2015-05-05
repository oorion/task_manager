class AddDefaultStatusToList < ActiveRecord::Migration
  def change
    remove_column :lists, :archived
    add_column :lists, :archived, :boolean, default: false
  end
end
