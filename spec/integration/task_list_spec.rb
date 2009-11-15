require File.dirname(__FILE__) + '/../spec_helper'

describe "As a logged user I want to be able to manage task lists" do

  before do
    @user ||= sign_in_as_user
    @user.task_lists.build(:title => 'Original Title').save
    click_link "My Task Lists"
  end
  
  context "while in the new task list form" do
    before do
      click_link "New Task List"
    end
    
    it "should create a new list" do
      fill_new_task_list_form
      response.should contain "Tasklist was successfully created."
      response.should contain "Test Title"
      response.should contain "Task 1"
      response.should contain "Task 2"
    end
  
    it "should see an error message with invalid data" do
      fill_new_task_list_form(false)
      response.should contain "prohibited this task list from being saved"
    end
  end
  
  context "while in the edit task list form" do
    before do
      click_link "Edit"
    end

    it "should edit the task list" do
      fill_in "Title", :with => "My New Title"
      click_button "Save"
      response.should contain "Tasklist was successfully updated."
      response.should contain "My New Title"
    end
    
    it "should see an error message with invalid data" do
      fill_in "Title", :with => ""
      click_button "Save"
      response.should contain "prohibited this task list from being saved"
    end
  end
  
  it "should see the task list details" do
    click_link "Original Title"
    response.should contain "Original Title"
  end
  
  it "should destroy a task list" do
    click_link "Destroy"
    response.should contain "Tasklist was successfully destroyed."
    response.should_not have_tag(".task_list")
    @user.task_lists.size.should == 0
  end
  
end