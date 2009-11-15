require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  
  should_have_many :task_lists
  should_have_many :watched_lists, :through => :watches
  should_have_many :watches
  
  should_allow_mass_assignment_of :name, :email, :password, :password_confirmation, :picture
  should_not_allow_mass_assignment_of :encrypted_password, :password_salt
  should_not_allow_mass_assignment_of :confirmation_token, :confirmed_at, :confirmation_sent_at
  should_not_allow_mass_assignment_of :reset_password_token 
  should_not_allow_mass_assignment_of :remember_token, :remember_created_at
  should_not_allow_mass_assignment_of :created_at, :updated_at
  
  should_validate_presence_of :name
  should_have_attached_file :picture, :styles => { :thumb => "40x40>" }
  should_validate_attachment_presence :picture
  should_validate_attachment_size :picture, :less_than => 100.kilobyte
  
  context "on watch stuff" do

    before do
      @user = User.new
      @task_list = TaskList.new
    end
  
    it "watch? should return false when a list is not watched" do
      @user.watch?(@task_list).should be_false
    end
  
    it "watch? should return true when a list is watched" do
      @user.watched_lists << @task_list
      @user.watch?(@task_list).should be_true
    end
  
    it "watch! should raise exception if trying to watch private list" do
      @task_list.private = true
      lambda { @user.watch!(@task_list) }.should raise_error
    end
  
    it "watch! should accept unwatched list" do
      @user.watch!(@task_list).should be_true
      @user.watched_lists.include?(@task_list).should be_true
    end
  
    it "watch! should remove from list if task list is already watched" do
      @user.watched_lists << @task_list
      @user.watch!(@task_list).should be_false
      @user.watched_lists.size.should == 0
    end
  end
end
