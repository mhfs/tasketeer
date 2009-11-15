require File.dirname(__FILE__) + '/../spec_helper'

describe "As a visitor I want to be able to browse public task lists" do
  
  it "should see (only) public lists in the homepage" do
    user_one = create_database_user('one@test.com.br')
    user_two = create_database_user('two@test.com.br')
    user_one.task_lists.build(:title => "First Public", :private => false).save
    user_one.task_lists.build(:title => "First Private", :private => true).save
    user_two.task_lists.build(:title => "Second Public", :private => false).save
    visit root_url
    response.should contain "First Public"
    response.should contain "Second Public"
    response.should_not contain "First Private"
  end
  
  it "should visit a task list details"

end