class CreateTableWatches < ActiveRecord::Migration
  def self.up
    create_table :watches, :id => false do |t|
      t.integer :task_list_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :watches
  end
end
