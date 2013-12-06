Civly::Application.routes.draw do

  root :to => 'pages#home'

  post '/users/:user_id/posts/:id/edit' => 'posts#update'
  get '/users/:user_id/posts/:id/edit' => 'posts#edit'
  delete '/users/:user_id/posts/:id/' => 'posts#destroy'

  resources :users do
    resources :posts
  end
  resources :authentications, only:[:new, :id, :email, :show, :create, :delete]



  get "/logout", to: "authentications#destroy", as: "logout"

  get 'users/new' => 'users#new'
  post 'users' => 'users#create'

  resources :business_authentications, only:[:new, :id, :show, :create, :delete]

  get 'businesses/new' => 'businesses#new'
  post 'businesses' => 'businesses#create'


  get 'businesses/new' => 'businesses#new'
  post 'businesses' => 'businesses#create'


  get 'all_posts(/:loc)' => 'posts#show_all'
  get 'change_status' => 'posts#change_status'


end
