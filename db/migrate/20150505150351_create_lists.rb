class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.boolean :archived

      t.timestamps null: false
    end
  end
end
