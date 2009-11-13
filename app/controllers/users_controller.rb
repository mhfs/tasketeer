class UsersController < InheritedResources::Base
  actions :new, :create
  
  def create
    create! { |success, failure| success.html { redirect_to root_url } }
  end
  
end