class Task < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name
  
  belongs_to :task_list
  
  validates_presence_of :name
  
end
