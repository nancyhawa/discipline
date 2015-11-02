Rails.application.routes.draw do

  root 'referrals#new'

  resources :students
  resources :referrals
  # resources :staff_members, only: [:index, :show] do
  resources :rosters
  # end

  post '/rosters/:id/title', to: 'rosters#title', as: 'roster_title'
  get '/staff_members/new', to: 'staff_members#new', as: 'new_staff_member'

  # devise_for :staff_members,
  devise_for :staff_members,
    :controllers => {:registrations => "staff_members/registrations"},
    path_names: {sign_up: ''}
  # devise_scope :staff_member do
  #   post '/registrations/staff_members', to: 'staff_members/registrations#create', as: 'create_staff_members'
  # end
  # devise_for :staff_members
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
