class ActionController::IntegrationTest

  def fill_new_task_list_form(valid = true)
    fill_in "Title", :with => "Test Title" if valid
    fill_in "task_list_tasks_attributes_0_name", :with => "Task 1"
    fill_in "task_list_tasks_attributes_1_name", :with => "Task 2"
    click_button "Save"
  end
  
  def fill_signup_form(valid = true)
    fill_in "Name", :with => "Test User"
    fill_in "Email", :with => "test@test.com"
    fill_in "Password", :with => "123mudar"
    fill_in "Password Confirmation", :with => "123mudar" if valid
    attach_file "Picture", File.join(Rails.root, 'spec', 'fixtures', 'picture.jpg')
    click_button "Save"
  end

  def sign_in_as_user(user=nil)
    user = create_database_user('test@test.com.br') unless user
    user.confirm!
    visit new_user_session_path
    fill_in 'email', :with => user.email
    fill_in 'password', :with => '123mudar'
    check 'remember me'
    click_button 'Sign In'
    response.should contain "Signed in successfully."
    user
  end

  def create_database_user(email)
    User.create!(
      :name => 'Test User',
      :email => email, 
      :password => '123mudar', 
      :password_confirmation => '123mudar', 
      :picture => fixture_file_upload('picture.jpg', 'image/jpeg')
    )
  end

  def create_user(options={})
    @user ||= begin
      user = create_database_user('test@test.com.br')
      user.confirm! unless options[:confirm] == false
      user
    end
  end

  def create_sample_users_and_lists
    user_one = create_database_user('user_one@test.com.br')
    user_two = create_database_user('user_two@test.com.br')
    task_list = user_one.task_lists.build(:title => "First Public", :private => false)
    task_list.tasks.build(:name => 'Sample Task')
    task_list.save
    user_one.task_lists.build(:title => "First Private", :private => true).save
    user_two.task_lists.build(:title => "Second Public", :private => false).save
  end

end