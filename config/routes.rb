Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get 'rules', to: 'pages#rules'
  get 'contact', to: 'pages#contact'
  get 'info', to: 'pages#info'
  get 'team', to: 'pages#team'
  get 'shop', to: 'pages#shop'
  get 'contact', to: 'pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teds do
    resources :chapters
  end
  resources :profiles, only: [:show, :edit, :update, :delete]
  resources :photos
end
