EcommerceProject::Application.routes.draw do
  
  root :to => 'store#index', :via => :get

  match 'store/:id' => 'store#show', :as => :store_product, :via => :get  

  match 'search_results' => 'store#search_results', :as => :search_results, :via => :post

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  match 'store/:id/add_product' => 'store#add_product', :as => :add_product, :via => :get

  match 'about' => 'page#about', :as => :about

  match 'contact_us' => 'page#contact_us', :as => :contact_us

  match 'cart' => 'store#shopping_cart', :as => :shopping_cart

  match 'clear_cart' => 'store#clear_cart', :as => :clear_cart

  match 'remove/:id' => 'store#remove_product', :as => :remove_product, :via => :get

  match 'cart/order' => 'store#order', :as => :order

  match '/newcust' => 'store#create_order', :as => :create_order, :via => :post
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
