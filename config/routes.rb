Civly::Application.routes.draw do

  root :to => 'pages#home'

  post '/users/:user_id/posts/:id/update' => 'posts#update'
  get '/users/:user_id/posts/:id/edit' => 'posts#edit'
  delete '/users/:user_id/posts/:id/' => 'posts#destroy'

  resources :users do
    resources :posts
  end
  resources :authentications, only:[:new, :id, :email, :show, :create, :delete]
  # resources :groups


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


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
