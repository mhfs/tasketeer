class User < ActiveRecord::Base
  devise :all
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation

  validates_presence_of :name
end
