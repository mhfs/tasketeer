class Users::TaskListsController < InheritedResources::Base
  before_filter :authenticate_user!
  belongs_to :user
  
  def create
    create! { |success, failure| success.html { redirect_to user_task_lists_path(@user) } }
  end
  
  def update
    update! { |success, failure| success.html { redirect_to user_task_lists_path(@user) } }
  end
  
  def destroy
    destroy! { user_task_lists_path(@user) }
  end
  
  protected
    def begin_of_association_chain
      @current_user
    end
  
end