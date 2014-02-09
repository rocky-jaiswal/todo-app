TodoApp::Application.routes.draw do
  get "lists/index"
  devise_for :users
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get "/greet" => "pages#greet", :as => 'greet'
      resources :lists do
        resources :items
      end
    end
  end
end
