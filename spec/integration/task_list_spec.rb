require File.dirname(__FILE__) + '/../spec_helper'

describe "As a logged user I want to be able to create a new task list" do
  it "should create a new list" do
    signin_and_fill_new_task_list_form
    response.should contain "Tasklist was successfully created."
    response.should contain "Test Title"
    response.should contain "Task 1"
    response.should contain "Task 2"
  end
  
  it "should see an error message with invalid params" do
    signin_and_fill_new_task_list_form(false)  
    response.should contain "prohibited this task list from being saved"
  end
end

describe "As a logged user I want to be able to edit a task list" do
  it "should edit a task list" do
    signin_and_fill_new_task_list_form
    click_link "My Task Lists"
    click_link "Edit"
    fill_in "Title", :with => "My New Title"
    click_button "Save"
    response.should contain "Tasklist was successfully updated."
    response.should contain "My New Title"
  end
end

describe "As a logged user I want to be able to destroy a task list" do
  it "should destroy a task list" do
    user = signin_and_fill_new_task_list_form
    click_link "My Task Lists"
    click_link "Destroy"
    response.should contain "Tasklist was successfully destroyed."
    user.task_lists.size.should == 0
  end
end

describe "As a logged user I want to be able to view the details of a task list" do
  it "should view the task list details" do
    signin_and_fill_new_task_list_form
    click_link "My Task Lists"
    click_link "Test Title"
    response.should contain "Test Title Details"
    response.should contain "Task 1"
    response.should contain "Task 2"
  end
end