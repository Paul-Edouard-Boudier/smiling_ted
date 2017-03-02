Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  namespace :admin do
    resources :users
    resources :chapters
    resources :photos
    resources :teds

  root to: "users#index"
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

    resources :teds, only: [:index, :show, :edit, :update] do
      post 'check_code', to: 'teds#check_code'
      resources :chapters
    end


    resources :profiles, only: :show
    resources :photos

    get 'smile', to: 'teds#new'
  end
end
