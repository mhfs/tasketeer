class TaskList < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :title, :private

  belongs_to :user
  
  validates_presence_of :title
end
