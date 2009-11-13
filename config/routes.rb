ActionController::Routing::Routes.draw do |map|
  map.devise_for :users
  map.resources :users, :only => [:new, :create]
  map.root :controller => 'homepage'
end
