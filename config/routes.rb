Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teds do
    resources :chapters
  end
  resources :profiles, only: [:show, :edit, :update, :delete]
end
