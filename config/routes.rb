TodoApp::Application.routes.draw do
  
  devise_for :users, :skip => [:sessions]
  as :user do
    post   '/api/v1/login'   => 'sessions#create'
    delete '/api/v1/logout'  => 'sessions#destroy'
  end
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :lists do
        resources :todos
      end
    end
  end

end
