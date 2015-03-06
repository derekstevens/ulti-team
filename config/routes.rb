Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, :only => [:show]
  resources :teams, :except => [:show, :edit, :update, :destroy] do 
    resources :team_rosters
    resources :games
    resources :practices
  end
  resources :rosters, :only => [:destroy]
  resources :roster_invites


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'dashboard' => 'users#dashboard'
  # You can have the root of your site routed with "root"
  get 'teams/:team_id' => 'teams#show', as: :team
  get 'teams/:team_id/edit' => 'teams#edit', as: :edit_team
  delete 'teams/:team_id' => 'teams#destroy'
  patch 'teams/:team_id' => 'teams#update'
  put 'teams/:team_id' => 'teams#update'
  post 'teams/:team_id/team_rosters/:id/copy' => 'team_rosters#copy'

  authenticated :user do 
    root to: 'users#dashboard', as: :authenticated_root
  end
  root 'static_pages#index'
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
