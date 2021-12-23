Rails.application.routes.draw do
  get 'message/emailreset'
  root "home#index", as: "home"

  get "press_release/source0" #testing source
  get "press_release/source1"
  get "press_release/source2"
  get "press_release/source3"
  get "press_release/source4"
  get "press_release/source5"
  get "press_release/source6"
  get "press_release/source7"
  get "press_release/source8"
  get "press_release/source9"
  get "press_release/source10"
  get "press_release/source11"
  get "press_release/source12"
  get "press_release/source13"
  get "press_release/source14"
  get "press_release/source15"
  get "press_release/source16"
  get "press_release/source16"
  get "press_release/source17"
  get "press_release/source18"
  get "press_release/source19"

  #get 'stock/:id' => 'stock#press_release' #good for: http://www.localhost:3000/stock/a2a/
  get "stock/:id" => "stock#index"  # Goes to --> http://localhost:3000/stock/a2a/?isin=IT0001233417

  get "market/italy"
  get "market/italy" => "market#italy"

  get "market/france"
  get "market/france" => "market#france"

  get "pages/contacts"
  post "contacts" => "pages#contacts"
  get "contacts" => "pages#contacts"

  get "pages/about"
  get "about" => "pages#about"

  post "send" => "pages#send"

  get "search/search"
  get "search" => "search#search"

  #devise_for :followers

  get "home/index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "signup" => "users#new"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  scope "(:locale)" do
    resources :market_suggestions_newsletters
    resources :analyses
    resources :follow_stock_newsletters
    resources :items
    resources :dax30_reports
    resources :users
    resources :markets
    resources :user_reports
    resources :cac40_reports
    resources :fias_reports
    resources :sources
    resources :stocks
    resources :users
    resources :source_frances
    resources :source_italies
    root "home#index", as: "home-locale", via: :all

    get "pages/contacts"
    get "pages/about"
    get "pages/privacy-policy"
  end

  devise_for :followers, :controllers => {:omniauth_callbacks => "followers/omniauth_callbacks"}
end
