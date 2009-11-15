require File.dirname(__FILE__) + '/../spec_helper'

describe Task do

  should_belong_to :task_list

  should_allow_mass_assignment_of :name
  should_not_allow_mass_assignment_of :created_at, :updated_at, :task_list_id
  
  should_validate_presence_of :name
  
end