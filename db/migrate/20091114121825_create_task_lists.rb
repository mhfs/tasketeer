class CreateTaskLists < ActiveRecord::Migration
  def self.up
    create_table :task_lists do |t|
      t.string :title
      t.integer :user_id
      t.boolean :private

      t.timestamps
    end
    
    add_index :task_lists, :user_id
  end

  def self.down
    drop_table :task_lists
  end
end
