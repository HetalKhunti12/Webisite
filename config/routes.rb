Rails.application.routes.draw do
  
  post '/tinymce_assets' => 'tinymce_assets#create'
  
  resources :bookings
  get "document/:id" => "bookings#document", as: :document
  resources :inquiries do
    get :edit_inquiry
    post :update_inquiry
  end
  get "approved/:id/:status" => "inquiries#approved"
  resources :static_pages do
    collection do
      get :about_us 
      get :how_it_works 
      get :testimonials 
      get :blog 
      get "leave_comment/:id" => "static_pages#leave_comment", as: :leave_comment
      post "comments/:id" => "static_pages#comments", as: :comments
    end 
  end

  resources :blogs do
    resources :comments
  end
  
  post '/rate' => 'rater#create', :as => 'rate'
  
  resources :reviews
  get 'home/index'

  resources :listings
  devise_for :contacts, controllers: { sessions: "sessions", registrations: "registrations", passwords: "passwords", confirmations: "confirmations" }
  get 'dashboard/index'

  resources :contacts 

  get "confirmation/:token" => "contacts#confirmation", as: :confirmation
  get "register" => "contacts#register", as: :register
  get "payment_section" => "contacts#payment_section", as: :payment_section
  post "save_contact" => "contacts#save_contact"
  post "webhook_events" => "contacts#webhook_events"
  get "paypal_checkout" => "contacts#paypal_checkout"
  get "confirm" => "contacts#confirm"
  get "states/:country_id" => "contacts#states"
  get "cities/:state_id" => "contacts#cities"
  get "sub_category/:cat_id" => "contacts#sub_category"
  get "edit_states/:country_id/:state_id" => "contacts#edit_states"
  get "edit_sub_category/:cat_id/:sub_category" => "contacts#edit_sub_category"
  
  resources :dashboards do
    get :get_events, on: :collection, format: :json
    get 'portal', on: :collection
  end

  resources :home do 
    get :search , on: :collection
    member do
      get :sub_categories 
    end
  end
  
  root 'home#index'

  resources :artist_profiles do
    get :top_artist_profiles , on: :collection
    member do
      get :download
      get :artist_profile_details 
    end
    resources :profile_videos
    resources :profile_images
  end
  
  resources :artist_service_orders 

  resources :calenders

  resources :billings

  resources :availabilities

  resources :categories do
    member do
      get :category_artist_profiles 
      get :artist_profile_inquiry
    end
  end

  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
  

  namespace :admin do
    get "/" => "contacts#new"
    get "sign_out" => "contacts#sign_out"
    resources :listings
    resources :contacts do 
      get :new_contact , on: :collection
      post :save_contact, on: :collection
    end
    resources :categories
    resources :artist_profiles do
      get :artist_profile_details
    end
    resources :dashboards
    resources :testimonials
    resources :abouts
    resources :how_it_works
    resources :blogs
    resources :inquiries
    resources :banners
    resources :social_media_links
    resources :users 
    post "about_update/:id" => "abouts#about_update", as: :about_update
   
    get 'update_profile/:id/:status' => "dashboards#update_profile"
  end
end
