class ActionController::IntegrationTest

  def create_user(options={})
    @user ||= begin
      user = User.create!(
        :name => 'Test User',
        :email => 'test@test.com.br', 
        :password => '123mudar', 
        :password_confirmation => '123mudar', 
        :picture => fixture_file_upload('picture.jpg', 'image/jpeg')
      )
      user.confirm! unless options[:confirm] == false
      user
    end
  end

  def sign_in_as_user(options={}, &block)
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