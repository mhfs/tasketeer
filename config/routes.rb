ActionController::Routing::Routes.draw do |map|
  map.devise_for :users
  
  map.root :controller => 'homepage'
end
