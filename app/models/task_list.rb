class TaskList < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :title, :private, :tasks_attributes

  belongs_to :user
  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :allow_destroy => true
  
  validates_presence_of :title, :user_id
  
  named_scope :public, :conditions => { :private => false }, :order => 'created_at DESC'
end
