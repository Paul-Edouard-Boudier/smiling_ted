Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /fr|en/ do
    root to: 'pages#home'

    get 'rules', to: 'pages#rules'
    get 'contact', to: 'pages#contact'
    get 'info', to: 'pages#info'
    get 'team', to: 'pages#team'
    get 'shop', to: 'pages#shop'

    resources :teds do
      resources :chapters
    end

    resources :profiles, only: :show
    resources :photos

    mount Attachinary::Engine => "/attachinary"
  end
end
