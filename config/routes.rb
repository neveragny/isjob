Getajob::Application.routes.draw do

  get "companies/index"

  get "employee/notepad"

  get "employer/index"

  root :to => "home#index"

  match '/auth/:provider/callback' => 'authentications#create'
  match '/auth/failure' => 'authentications#failure'


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations' } do
    match '/users/sign_up/:company' => 'registrations#new'
  end

  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  match 'companies/positions' => 'companies#positions', :as => :"positions"
  resources :companies do
    resources :positions
  end

  resource :cv, :only => [:new, :create, :destroy]
  match 'cv/:id' => 'cvs#show', :as => :cv_route

  match 'users/update/user_details' => 'users#update_user_details', :as => :user_details

  match 'employee/notepad' => 'employee#notepad', :as => :employee_notepad  
  match 'employee/cv' => 'employee#cv_list', :as => :employee_cv_list
  match 'employee/details' => 'employee#details', :as => :employee_details
  match 'employee/bookmarks' => 'employee#bookmarks', :as => :employee_bookmarks
  match 'employee/calendar' => 'employee#calendar', :as => :employee_calendar
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
  # match ':controller(/:action(/:id(.:format)))'
end
