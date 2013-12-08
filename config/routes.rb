Civly::Application.routes.draw do

  root :to => 'pages#home'

  post '/users/:user_id/posts/:id/edit' => 'posts#update'
  get '/users/:user_id/posts/:id/edit' => 'posts#edit'
  delete '/users/:user_id/posts/:id/' => 'posts#destroy'

  resources :users do
    resources :posts
  end
  resources :authentications, only:[:new, :id, :email, :show, :create, :delete, :destroy, :index]

  resources :profiles

  get "/logout", to: "authentications#destroy", as: "logout"

  get "/authentications", to: "pages#home"

  get 'users/new' => 'users#new'
  get 'users/edit' => 'users#edit'
  get 'users/index' => 'users#index'
  post 'users' => 'users#create'

  resources :business_authentications, only:[:new, :id, :show, :create, :delete]

  get 'businesses/new' => 'businesses#new'
  post 'businesses' => 'businesses#create'

  get 'businesses/new' => 'businesses#new'
  post 'businesses' => 'businesses#create'


  get 'all_posts(/:loc)' => 'posts#show_all'

  get 'all_users(/:loc)' => 'users#show_all'
  get 'change_status' => 'posts#change_status'


end
