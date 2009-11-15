class Users::TaskListsController < InheritedResources::Base
  defaults :route_prefix => nil
  before_filter :authenticate_user!
  belongs_to :user

  def new
    @user = current_user
    @task_list = @user.task_lists.build
    2.times { @task_list.tasks.build }
    new!
  end
  
  protected
  
    def collection
      @task_lists ||= end_of_association_chain.find(:all, :include => [:user, :tasks]).paginate(:page => params[:page])
    end
    
    def begin_of_association_chain
      @current_user
    end
end