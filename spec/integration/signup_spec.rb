require File.dirname(__FILE__) + '/../spec_helper'

describe "As a visitor I want to be able to sign up" do
  
  before do
    visit root_url
    click_link "Sign Up"
  end

  def confirmation_path
    user_confirmation_path(:confirmation_token => User.find_by_email("test@test.com").confirmation_token)
  end
  
  it "should sign up, confirm account and get signed in" do
    fill_signup_form(true)
    response.should contain "User was successfully created"
    visit confirmation_path
    response.should contain "Your account was successfully confirmed. You are now signed in."
    response.should contain "Hello Test User!"
  end
  
  it "should see an error message with invalid params" do
    fill_signup_form(false)
    response.should contain "prohibited this user from being saved"
  end
  
end