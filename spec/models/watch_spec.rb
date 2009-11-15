require File.dirname(__FILE__) + '/../spec_helper'

describe Watch do
  
  should_belong_to :watched_list, :class_name => 'TaskList', :foreign_key => :task_list_id
  should_belong_to :watcher, :class_name => 'User', :foreign_key => :user_id
  
end