class AddPrivateIndexToTaskList < ActiveRecord::Migration
  def self.up
    add_index :task_lists, :private
  end

  def self.down
    remove_index :task_lists, :private
  end
end
