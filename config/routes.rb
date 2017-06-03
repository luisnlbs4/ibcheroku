Rails.application.routes.draw do


  get 'familiars/create'

  resources :publications
  devise_for :users

  root 'welcome#index'
  get '/new'=>'welcome#new'
  get '/lock_unlock' => 'user#lock_unlock'
  get '/user' => 'user#index'
  get '/user/new' => 'user#new'
  get '/user/:id/edit_password' => 'user#edit_password'
  post '/user/:id/update_password' => 'user#update_password'
  post '/user' => 'user#create'


  post 'message' => 'welcome#message'

  get '/blinds/new' => 'blinds#new'
  get '/blinds' => 'blinds#index'
  get '/blinds/:id/edit' => 'blinds#edit'
  get '/blinds/:id' => 'blinds#show'
  post '/blinds/:id/update' => 'blinds#update'
  post 'blinds' => 'blinds#create'


  get '/familiars/:id/delete' => 'familiars#delete'
  get '/familiars/:id/edit' => 'familiars#edit'
  post 'familiars' => 'familiars#create'
  post '/familiars/:id/update' => 'familiars#update'


  # get 'welcome/index'
  get '/reports' => 'blinds#reports'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  get '/publications/new' => 'publications#new'
  get '/publications' => 'publications#index'
  post 'publications' => 'publications#create'
  get '/publications/:id' => 'publications#show'
  get 'publications/index'


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
