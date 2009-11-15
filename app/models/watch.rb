class Watch < ActiveRecord::Base
  belongs_to :watched_list, :class_name => 'TaskList', :foreign_key => :task_list_id
  belongs_to :watcher, :class_name => 'User', :foreign_key => :user_id
end