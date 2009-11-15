require File.dirname(__FILE__) + '/../spec_helper'

describe "As a logged user I want to be able to manage my watches" do
  
  def watch_task_list
    @task_list = TaskList.first
    visit root_url
    click_link "watch_#{@task_list.id}"
  end
  
  before do
    @user = signin_and_fill_new_task_list_form
    create_sample_users_and_lists
  end
  
  it "should watch a list" do
    watch_task_list
    response.should have_tag('#watches .task_list', :count => 1)
    response.flash[:notice].should == "Your are now watching #{@task_list.title}"
  end
  
  it "should unwatch a watched list" do
    watch_task_list
    visit watches_user_task_lists_path(@user)
    click_link "unwatch_#{@task_list.id}"
    response.flash[:notice].should == "Your are no longer watching #{@task_list.title}"
    response.should_not have_tag('.task_list')
  end
  
  it "should not watch a private list" do
    private_list = TaskList.first(:conditions => {:private => true})
    lambda { visit toggle_watch_user_task_list_path(@user, private_list) }.should raise_error
  end

end