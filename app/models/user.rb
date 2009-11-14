class User < ActiveRecord::Base
  devise :all

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :picture

  has_attached_file :picture, :styles => { :thumb => "30x30>" }

  validates_presence_of :name
  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 100.kilobyte


end
