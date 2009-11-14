class Users::TaskListsController < InheritedResources::Base
  defaults :route_prefix => ''
  before_filter :authenticate_user!
  belongs_to :user
  
  protected
    def begin_of_association_chain
      @current_user
    end
end