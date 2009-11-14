require File.dirname(__FILE__) + '/../spec_helper'

describe TaskList do

  should_belong_to :user

  should_allow_mass_assignment_of :title, :private
  should_not_allow_mass_assignment_of :created_at, :updated_at, :user_id
  
  should_validate_presence_of :title
  
  should_have_scope :public, :conditions => { :private => false }, :order => 'created_at DESC'
  
end