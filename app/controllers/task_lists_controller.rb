class TaskListsController < InheritedResources::Base
  actions :index, :show
  
  protected
    def collection
      @task_lists ||= TaskList.public.find(:all, :include => [:user, :tasks]).paginate(:page => params[:page])
    end
end