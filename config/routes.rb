Roomnhouse::Application.routes.draw do
  resources :inquiries do
    resources :messages
  end
  resources :bookings do
    post 'payu_return', on: :collection
  end
  resources :reviews, only: [:new, :create, :update, :edit]
  resources :messages do
    get 'inbox', on: :collection
    get 'sent', on: :collection
  end
  resources :trips
  match '/support' => 'info#support'
  match '/terms' => 'info#terms'
  match '/cancellation' => 'info#cancellation'
  match '/privacy' => 'info#privacy'
  match '/howtohost' => 'info#howtohost'
  match '/whyhost' => 'info#whyhost'
  resources :floods
  devise_for :users, controllers: {registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users do
    get 'dashboard', on: :member
  end
  resources :search , only:  [:index]
  resources :aboutus, only: [:index]
  resources :how, only: [:index]
  resources :discounts
  resources :floods, only: [:index]

  resources :offers do
    get 'overview', on: :member
    resource :translations, only: [:edit,:update]
    resource :calendar
    resources :photos
    resource :details, only: [:edit,:update]
    resource :addresses, only: [:edit,:update]
    resource :pricing, only: [:edit,:update]
  end
  root :to => "home#index"
end
