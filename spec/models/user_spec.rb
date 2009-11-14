require File.dirname(__FILE__) + '/../spec_helper'

describe User do

  should_allow_mass_assignment_of :name, :email, :password, :password_confirmation, :picture
  should_not_allow_mass_assignment_of :encrypted_password, :password_salt
  should_not_allow_mass_assignment_of :confirmation_token, :confirmed_at, :confirmation_sent_at
  should_not_allow_mass_assignment_of :reset_password_token 
  should_not_allow_mass_assignment_of :remember_token, :remember_created_at
  should_not_allow_mass_assignment_of :created_at, :updated_at
  
  should_validate_presence_of :name
  should_have_attached_file :picture, :styles => { :thumb => "30x30>" }
  should_validate_attachment_presence :picture
  should_validate_attachment_size :picture, :less_than => 100.kilobyte
  
end
