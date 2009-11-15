require File.dirname(__FILE__) + '/../spec_helper'

describe "As a visitor I want to be able to browse public task lists" do
  
  before do
    user_one = create_database_user('one@test.com.br')
    user_two = create_database_user('two@test.com.br')
    task_list = user_one.task_lists.build(:title => "First Public", :private => false)
    task_list.tasks.build(:name => 'Sample Task')
    task_list.save
    user_one.task_lists.build(:title => "First Private", :private => true).save
    user_two.task_lists.build(:title => "Second Public", :private => false).save
    visit root_url
  end
  
  it "should see (only) public lists in the homepage" do
    response.should contain "First Public"
    response.should contain "Second Public"
    response.should_not contain "First Private"
  end
  
  it "should visit a task list details" do
    click_link "First Public"
    response.should contain "First Public Details"
    response.should contain "Sample Task"
  end

end