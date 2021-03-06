Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  namespace :admin do
    resources :teds
    resources :chapters
    resources :photos
    resources :users

  root to: "teds#index"
  end

 devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  scope '(:locale)', locale: /fr|en/ do
    root to: 'pages#home'

    get 'rules', to: 'pages#rules'
    get 'contact', to: 'pages#contact'
    get 'info', to: 'pages#info'
    get 'team', to: 'pages#team'
    get 'shop', to: 'pages#shop'

    resources :teds, only: [:index, :show, :edit, :update, :create] do
      post 'check_code', to: 'teds#check_code'
      resources :chapters
    end

    resources :profiles, only: :show
    resources :photos, only: [:show, :new, :create]

    get 'smile', to: 'teds#new'

  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :teds, only: [ :index, :show ]
    end
  end
end
