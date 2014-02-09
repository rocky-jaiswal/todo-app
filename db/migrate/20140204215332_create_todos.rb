class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.string :status
      t.text :tags
      t.integer :list_id

      t.timestamps
    end
  end
end
