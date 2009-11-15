require File.dirname(__FILE__) + '/../spec_helper'

describe TaskList do

  should_belong_to :user
  should_have_many :tasks, :dependent => :destroy
  should_accept_nested_attributes_for :tasks, :allow_destroy => true

  should_allow_mass_assignment_of :title, :private, :tasks_attributes
  should_not_allow_mass_assignment_of :created_at, :updated_at, :user_id
  
  should_validate_presence_of :title, :user_id
  
  should_have_scope :public, :conditions => { :private => false }, :order => 'created_at DESC'
  
end