ActionController::Routing::Routes.draw do |map|
  map.devise_for :users
  map.resources :users, :only => [:new, :create] do |users|
    users.resources :task_lists, :controller => 'users/task_lists'
  end
  map.root :controller => 'homepage'
end
