Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'articles#blog'

  get 'blog',          to: 'articles#blog'
  get 'basics',        to: 'articles#basics'
  get 'guides',        to: 'articles#guides'
  get '/articles/:id', to: 'articles#show', as: 'article'

  get 'contacts', to: 'application#contacts'
  get 'about',    to: 'application#about'

  get 'profile',          to: 'users#profile'
  get 'edit_profile',     to: 'users#edit_profile'
  patch 'update_profile', to: 'users#update_profile'

  post 'comment_like',       to: 'shiny_comments#comment_like'
  post 'comment_dislike',    to: 'shiny_comments#comment_dislike'
  get  'new_sub_comment',    to: 'shiny_comments#new_sub_comment'
  post 'create_sub_comment', to: 'shiny_comments#create_sub_comment'

  resources :shiny_comments
  resources :likes
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

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
