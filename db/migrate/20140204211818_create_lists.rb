class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :status
      t.text :tags, array: true, default: '{}'
      t.integer :user_id
      t.timestamps
    end
  end
end
