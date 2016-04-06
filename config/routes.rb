Rails.application.routes.draw do
  #backend mgt resources
  jsonapi_resources :designers do 
    jsonapi_resources :collections do
      jsonapi_resources :products do
        jsonapi_resources :product_details
      end
    end
  end

  #customer facing resources
  jsonapi_resources :mail_lists
  jsonapi_resources :customers
  jsonapi_resources :orders
  jsonapi_resources :payments
  resources :shops
  resources :charges
  resources :account_activations, only: [:edit]  
  resources :password_resets, only: [:new, :create, :edit, :update]
  jsonapi_resources :collections
  jsonapi_resources :products
  #look up resources
  jsonapi_resources :countries
  jsonapi_resources :categories

  # mount_ember_app :frontend, to: "/"
end