Lori::Application.routes.draw do
  devise_for :users
  get "main/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'

  # Example of regular route:
     
     get 'about_path' => 'main#viewAbout'
     get 'account_details_path' => 'account#userIndex'
     get 'admin_home' => 'admin#index'
     get 'admin_colorscheme' => 'admin#colorscheme'
     post 'admin_colorscheme' => 'admin#colorscheme'
     get 'admin_edit_event' => 'admin#eventIndex'
     post 'admin_edit_event' => 'admin#createEvent'
     get 'admin_account_index' => 'admin#userIndex'
     post 'admin_edit_account' => 'admin#userEdit'
     get 'admin_vendors' => 'admin#vendorlist'
     post 'admin_vendors' => 'admin#vendorlist'
     get 'attendee_list_path' => 'account#attendeelist'
     get 'color_scheme_path' => 'account#colorscheme'
     post 'color_scheme_path' => 'account#colorscheme'
     get 'contact_path' => 'main#viewContact'
     get 'create_event_path' => 'account#createEvent'
     post 'create_event_path' => 'account#createEvent'
     get 'creations_path' => 'creations#index'
     get 'creations/:projectid' => 'creations#show'
     get 'current_user_path' => 'account#index'
     get 'customer_tool_path' => 'admin#customer'
     get 'delete_form' => 'admin#delete_form'
     post 'edit_user_path' => 'account#userEdit'
     get 'event_index_path' => 'account#eventIndex' 
     get 'form_index' => 'admin#form_index'
     get 'profile_path' => 'profile#index'
     post 'submitContact' => 'main#acceptForm'
     get 'todo_list_path' => 'account#todolist'
     get 'tools_path' => 'tools#index'
     get 'vendors_path' => 'vendors#index' 
     get 'vendors_path/:vendortype' => 'vendors#show'
     get 'vendor_list_path' => 'account#vendorlist'
     post 'vendor_list_path' => 'account#vendorlist'
     get 'view_account' => 'admin#viewAccount'      

     get 'make_admin' => 'admin#tempMakeAdmin' 
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
