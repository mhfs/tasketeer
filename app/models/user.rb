class User < ActiveRecord::Base
  devise :authenticatable, :confirmable, :recoverable, :rememberable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :picture
  
  has_many :task_lists
  has_many :watched_lists, :through => :watches, :class_name => "TaskList"
  has_many :watches
  has_attached_file :picture, :styles => { :thumb => "40x40>" }

  validates_presence_of :name
  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 100.kilobyte

  def watch?(task_list)
    watched_lists.include?(task_list)
  end

  # add a task list to the watched_lists if it's public and no watched yet
  # if it's already watched it will remove the list from watched_lists
  def watch!(task_list)
    raise ArgumentError, "need a public task list" unless task_list.public?
    unless watch?(task_list)
      watched_lists << task_list
      return true
    else
      watched_lists.delete(task_list)
    end
    return false
  end

end