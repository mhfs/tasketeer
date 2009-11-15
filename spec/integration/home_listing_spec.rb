require File.dirname(__FILE__) + '/../spec_helper'

describe "As a visitor I want to be able to browse public task lists" do
  
  before do
    create_sample_users_and_lists
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