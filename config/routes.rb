Bnbhub::Application.routes.draw do

  resources :emails

  resources :affiliates

  resources :sunburn_systems
  resources :package_bookings do
    post 'payu_return', on: :collection
  end
  resources :packages

  get "i/:id" => "invites#show"
  get "invites" =>"invites#index"
  post "i/emailer" => "invites#emailer"

  match "/contacts/:importer/callback" => "users/contacts_callbacks#importer"
  # get "admin/index"

  get "sitemaps/index"
  get "articles/index"
  get "articles/show"
  get "topics/index"
  get "topics/show"
  get "sitemap.xml" => "sitemaps#index", as: "sitemap", defaults: { format: "xml" }

  namespace :admin do
    resources :users do
      resources :offers do
        resource :translation
        resources :photos
        resources :amenities
      end
    end
  end
=begin
namespace :admin do
    get ""  => "admin#index"

    namespace :api do
      namespace :v1 do
        resources :offers do
        end

          resources :translations
          resources :photos
        resources :users
      end
    end

    get "/users/new" => "admin#index"
    get "/users/" => "admin#index"
    get "/users/:id" => "admin#index"
    get "/offers/:id" => "admin#index"
    get "/offers" => "admin#index"
    get "/offers/new" => "admin#index"
    get "/photos" => "admin#index"
    get "/photos/:id" => "admin#index"
    get "/photos/new" => "admin#index"
    get "/translations" => "admin#index"
    get "/translations/:id" => "admin#index"
    get "/translations/new" => "admin#index"
  end
=end

  resource 'help', only: [:index] do
    resources :topics, only: [:index, :show]
    resources :articles, only: [:index, :show]
  end

  get "payouts/edit"

  resources :payouts, only: [:index, :edit]
  match '/404', :to  =>  "errors#not_found"

  resources :inquiries do
    resources :messages
  end

  # match '/sunburngoa2014test' => 'info#sunburn'
  match '/sunburngoa2014' => 'home#index'
  resources :messages do
    get 'inbox', on: :collection
    get 'sent', on: :collection
  end

  resources :bookings do
    post 'payu_return', on: :collection
    get 'email', on: :collection
  end

  resources :trips do
    resource :review       #passing the review here so that in the url trip_id can be used with offer reviews
  end

  match '/support' => 'info#support'
  match '/terms' => 'info#terms'
  match '/cancellation' => 'info#cancellation'
  match '/privacy' => 'info#privacy'
  match '/howtohost' => 'info#howtohost'
  match '/whyhost' => 'info#whyhost'
  match '/dabba-drive' => 'info#dabbadrive'
  match '/hire-car' => 'info#carhire'
  post '/dabba_drive' => 'dabba_drives#create'
  match '/contest' => 'info#contest'
  resources :floods

  devise_for :users, controllers: {registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }

  match "/dashboard" => "users#dashboard"
  resources :users do
    get 'dashboard', on: :collection
  end


  resources :aboutus, only: [:index]
  resources :how, only: [:index]
  resources :discounts
  resources :floods, only: [:index]

  resources :offers do
    resources :wizard_steps, only: [:edit, :update]
    get 'overview', on: :member
    resource :translations, only: [:edit,:update]
    resource :calendar
    resources :photos
    resource :details, only: [:edit,:update]
    resource :addresses, only: [:edit,:update]
    resource :pricing, only: [:edit,:update]
  end

  get '/search' => "search#index"
  post '/search' => "search#search"
  match '/search/:destination' => "search#index", :as => :search, :via => [:get]
  root :to => "home#index"

  resources :shouts do
    get 'available', on: :collection
  end
  resources :shout_discounts
end
