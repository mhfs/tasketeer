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
  
  def watches
    @watches = current_user.watched_lists
  end
  
  def toggle_watch
    task_list = TaskList.find(params[:id])
    if current_user.watch!(task_list)
      flash[:notice] = "Your are now watching #{task_list.title}"
    else
      flash[:notice] = "Your are no longer watching #{task_list.title}"
    end
    redirect_to watches_user_task_lists_path(current_user)
  end
  
  protected
  
    def collection
      @task_lists ||= end_of_association_chain.find(:all, :include => [:user, :tasks]).paginate(:page => params[:page])
    end
    
    def begin_of_association_chain
      @current_user
    end
end