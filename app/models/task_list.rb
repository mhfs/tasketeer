class TaskList < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :title, :private

  belongs_to :user
  
  validates_presence_of :title
  
  named_scope :public, :conditions => { :private => false }, :order => 'created_at DESC'
end
