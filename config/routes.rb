Rails.application.routes.draw do
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

    root "admin#index"
  
  resources :users 

  # for filterrific
  resources :anchor_logos do
    get :reset_filterrific, on: :collection
  end

  resources :ac_motors do
    get :reset_filterrific, on: :collection
  end

  resources :bearings do
    get :reset_filterrific, on: :collection
  end
  resources :greases do
    get :reset_filterrific, on: :collection
  end
  resources :brush_holders do
    get :reset_filterrific, on: :collection
  end
  resources :c_clips do
    get :reset_filterrific, on: :collection
  end
  resources :capacitors do
    get :reset_filterrific, on: :collection
  end
  resources :carbon_brushes do
    get :reset_filterrific, on: :collection
  end
  resources :connectors do
    get :reset_filterrific, on: :collection
  end
  resources :copperwires do
    get :reset_filterrific, on: :collection
  end
  resources :cord_clips do
    get :reset_filterrific, on: :collection
  end
  resources :cords do
    get :reset_filterrific, on: :collection
  end
  resources :grommets do
    get :reset_filterrific, on: :collection
  end
  resources :nuts do
    get :reset_filterrific, on: :collection
  end
  resources :plastic_materials do
    get :reset_filterrific, on: :collection
  end
  resources :screws do
    get :reset_filterrific, on: :collection
  end
  resources :spiral_springs do
    get :reset_filterrific, on: :collection
  end
  resources :springs do
    get :reset_filterrific, on: :collection
  end
  resources :washers do
    get :reset_filterrific, on: :collection
  end


  # for each category of material
  resources :anchor_logos
  resources :ac_motors
  resources :bearings
  resources :brush_holders
  resources :c_clips
  resources :capacitors
  resources :carbon_brushes
  resources :connectors
  resources :copperwires
  resources :cords
  resources :cord_clips
  resources :greases
  resources :grommets
  resources :nuts
  resources :plastic_materials
  resources :screws
  resources :spiral_springs
  resources :springs
  resources :washers

  #for import function
  resources :anchor_logo_imports
  resources :ac_motor_imports
  resources :bearing_imports
  resources :brush_holder_imports
  resources :c_clip_imports
  resources :capacitor_imports
  resources :carbon_brush_imports
  resources :connector_imports
  resources :copperwire_imports
  resources :cord_imports
  resources :cord_clip_imports
  resources :grease_imports
  resources :grommet_imports
  resources :nut_imports
  resources :plastic_material_imports
  resources :screw_imports
  resources :spiral_spring_imports
  resources :spring_imports
  resources :washer_imports

  # blocking and unblocking object
  resources :ac_motors, :anchor_logos, :bearings, :brush_holders, :c_clips, :capacitors,
            :carbon_brushes, :connectors, :copperwires, :cords, :cord_clips, :greases,
            :grommets, :nuts, :plastic_materials, :screws, :spiral_springs, :springs, :washers do
    member do
      patch :block
      patch :unblock
      patch :approve
      patch :release
      get   :needs_editing
      get   :correct
    end
  end

  
  get "superadmin/approval_by_superadmin"
  get "superadmin/create_by_superadmin"

  get "pending/index"
  get "admin" => "admin#index"


  #session
  resources :sessions
  controller :sessions do
    get '/login' => :new, :via => :get
    match '/login' => :create, :via => :post
    # match '/logout' => :destroy, :via => :delete
    delete '/logout', to: 'sessions#destroy', as: :logout
    get 'change_details' => :change_details
    get 'update_details' => :update_details
    get 'show_details' => :show_details
  end


  #user profile
  get "profile/index"
  get "profile/edit"
end
