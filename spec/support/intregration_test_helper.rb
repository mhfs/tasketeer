class ActionController::IntegrationTest

  def create_sample_users_and_lists
    user_one = create_database_user('one@test.com.br')
    user_two = create_database_user('two@test.com.br')
    task_list = user_one.task_lists.build(:title => "First Public", :private => false)
    task_list.tasks.build(:name => 'Sample Task')
    task_list.save
    user_one.task_lists.build(:title => "First Private", :private => true).save
    user_two.task_lists.build(:title => "Second Public", :private => false).save
  end

  def signin_and_fill_new_task_list_form(valid = true)
    user = sign_up_and_login
    visit user_task_lists_path(user)
    click_link "New Task List"
    fill_in "Title", :with => "Test Title" if valid
    fill_in "task_list_tasks_attributes_0_name", :with => "Task 1"
    fill_in "task_list_tasks_attributes_1_name", :with => "Task 2"
    click_button "Save"
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

  def sign_up_and_login(options={}, &block)
    user = create_user(options)
    visit new_user_session_path unless options[:visit] == false
    fill_in 'email', :with => 'test@test.com.br'
    fill_in 'password', :with => '123mudar'
    check 'remember me' if options[:remember_me] == true
    yield if block_given?
    click_button 'Sign In'
    user
  end

end