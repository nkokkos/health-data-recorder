require 'resque/server'

Rails.application.routes.draw do

  root :to => 'home#index'

  get 'home/index'
  get 'triggers/show'
  get 'triggers/index'
  get 'triggers/edit'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, :controllers => { :registrations => "registrations" }

  authenticate :user do 
    #this will mount the Resque Server UI unless the user is not admin. 
	#if a user that is not admin tries to access /resque, then he/she will be
	#presented with a "no route matches /resque error"
	#Constraint::Admin.new is defined in /lib/constraint/admin.rb
	mount Resque::Server.new, at: "/resque", constraints: Constraint::Admin.new
  end
  # Read below to learn how to authenticate user with a certain attribute; eg. admin
  #http://blog.yanted.com/2014/08/27/rails-constraints-custom-routes/
  #http://spin.atomicobject.com/2012/03/19/dynamic-rails-routes-with-warden-devise-and-constraints/
  #https://www.codementor.io/tips/8132473431/use-custom-routing-constraints-to-limit-access-to-rails-routes-via-warden
  
  # to do: implement the above
 
  #this is how you add new views to device:
  #http://stackoverflow.com/questions/20599714/rails-add-new-view-to-devise
  devise_scope :user do
    get  "/users/settings"       => "registrations#settings"
    post "/users/settings_save"  => "registrations#settings_save"
	post "/users/update_medical_personnel" => "registrations#update_medical_personnel"
	get  "/users/token"          => "registrations#token"
	get  "/users/notsignup"      => "registrations#nosignup"
  end

  # to do-> this route has to go? (since it's covered by resources :devices)
  get '/devices/:id', to: 'devices#show', as: 'device'

  #get '/events', to: 'events#index', as: 'event'
  resources :events
  
  get '/measurement_updates', to: 'measures#updates', as: 'measurement_update'

  #nested routes, it works nicely for devices and measures
  resources :devices, only: [:index, :show] do
    resources :measures, only: [:index, :show]
  end

  # routes for javascript update drop down boxes. Look at /views/measures/show
  get '/devices/:device_id/measures/:id/sevendays',  to: 'measures#sevendays',  as: 'measures_sevendays'
  get '/devices/:device_id/measures/:id/thirtydays', to: 'measures#thirtydays', as: 'measures_thirtydays'
  get '/devices/:device_id/measures/:id/sixmonths',  to: 'measures#sixmonths',  as: 'measures_sixmonths'
  get '/devices/:device_id/measures/:id/c_year',     to: 'measures#c_year',     as: 'measures_c_year'
  get '/devices/:device_id/measures/:id/l_year',     to: 'measures#l_year',     as: 'measures_l_year'

  #routes for javascript update drop down boxes. Look at /views/devices/show
  get '/devices/:id/sevendays',  to: 'devices#sevendays',  as: 'devices_sevendays'
  get '/devices/:id/thirtydays', to: 'devices#thirtydays', as: 'devices_thirtydays'
  get '/devices/:id/sixmonths',  to: 'devices#sixmonths',  as: 'devices_sixmonths'
  get '/devices/:id/c_year',     to: 'devices#c_year',     as: 'devices_c_year'
  get '/devices/:id/l_year',     to: 'devices#l_year',     as: 'devices_l_year'

  #SOS: I need to put '/patients/add_remove' get method before show,
  #otherwise it does not work!!
  #see this stackoverflow question/answer:
  #http://stackoverflow.com/questions/25298949/rails-in-controller-a-new-view-is-always-rendered-by-show
  get '/patients/add_remove', to: 'patients#add_remove', as: 'patient_add_remove'

  resources :patients do
    resources :trigger_blocks do
	    resources :triggers
	  end
  end

  #http://stackoverflow.com/questions/8706774/undefined-method-with-path-while-using-rails-form-for
  #since I am not using the resources method:
  #get '/patients/:id/trigger_blocks',     to: 'trigger_blocks#index',   as: 'trigger_blocks'
  #get '/patients/:id/trigger_blocks/new', to: 'trigger_blocks#new',     as: 'new_trigger_block'
  #post '/patients/:id/trigger_blocks/',   to: 'trigger_blocks#create'
  #delete '/patients/:id/trigger_blocks/:trblock_id', to: 'trigger_blocks#destroy', as: 'destroy_trigger'

  #http://stackoverflow.com/questions/25298949/rails-in-controller-a-new-view-is-always-rendered-by-show
  #get '/patients/add_remove', to: 'patients#add_remove', as: 'patient_add_remove'
  #get '/patients',            to: 'patients#index'
  #get '/patients/:id',        to: 'patients#show', as: 'patient'

  resources :patient_relationships

  # don't use :measurements are resource yet
  #namespace :api do
  #  resources :measurements
  #end

  # http://stackoverflow.com/questions/23590408/unknown-format-in-rails-4
  # make sure you input the default format json:
  namespace :api do
    get  '/devices', to: 'devices#index',  defaults: { format: 'json' }
    get  '/measurement_blocks', to: 'measurement_blocks#index',  defaults: { format: 'json' }
    get  '/measures', to: 'measures#index',  defaults: { format: 'json' }
    get  '/measurements', to: 'measurements#index', defaults: { format: 'json' }
    post '/measurement_blocks/create', to: 'measurement_blocks#create',  defaults: { format: 'json' }
    post '/measurements/create', to: 'measurements#create',  defaults: { format: 'json' }
  end

  #examples of routing:
  #devise_scope :user do
  #  get "users/settings"=> "users/registrations#settings", :as => "sign_up2_registration"
  #end

  #match '/settings/access', :to => 'users#edit', via: [:get, :post]

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
