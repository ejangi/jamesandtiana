Jamesandtiana::Application.routes.draw do

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
  resources :users
  resources :celebrations, :controller => :registries do
    member do
      get 'introduction'
      put 'rsvp'
    end
    resources :gifts do
      get 'contribute'
      put 'contribution'
      post 'contribution'
    end
  end
  resources :gifts
  resources :contributions
  resources :rsvps
  
  # match ':registry_permalink', :as => "registries", :controller => "registries", :action => "introduction", :constraints => { :registry_permalink => /engagement|wedding/ }
  # match ':registry_permalink/information(.:format)', :as => "registries", :controller => "registries", :action => "show", :constraints => { :registry_permalink => /engagement|wedding/ }
  # match ':registry_permalink/rsvp(.:format)', :as => "rsvp", :controller => "registries", :action => "rsvp", :constraints => { :registry_permalink => /engagement|wedding/ }
  # match ':registry_permalink/gifts(.:format)', :as => "gifts", :controller => "gifts", :action => "index", :constraints => { :registry_permalink => /engagement|wedding/ }
  # match ':registry_permalink/gifts/:id(.:format)', :as => "gifts", :controller => "gifts", :action => "show", :constraints => { :registry_permalink => /engagement|wedding/ }
  # match ':registry_permalink/gifts(/:id(/:action(.:format)))', :as => "gifts", :controller => "gifts", :constraints => { :registry_permalink => /engagement|wedding/ }
  
  resource :user_session
  resource :account, :controller => "users"
  
  # match ':key', :controller => "UserSessions", :action => "quicklogin", :constraints => { :key => /[a-z0-9]{40}/ }
  
  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  
  match "/admin" => redirect("/users")
  
  root :to => "home#index"
end
