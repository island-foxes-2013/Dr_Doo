DrDoo::Application.routes.draw do

  devise_for :views

  devise_for :users 

  resources :forms

  resources :forms do 
    post '/create_or_update_contact_info', to: 'forms#create_or_update_contact_info'
  end

  # resources :complete_forms, except: [:index]

  # TODO-JW: RESTful way, using AJAX to submit one form per answer
   # resources :answers, only: [:create, :update]

  # TODO-JW (my preference): non-RESTful single route to submit all
  #                          answers at once (which allows you to
  #                          wrap the saving of all answers in one
  #                          DB transaction)
  #
  # e.g. ...
  #
  # Answer.transaction do |t|
  #   # normal ActiveRecord code to create new answers
  #   params[:answers].each do |a|
  #     Answer.create(a)
  #   end
  # end
  resources :complete_forms do
    post '/save_all_answers', to: 'complete_forms#save_all_answers'
  end
  root to: 'home#index'
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
