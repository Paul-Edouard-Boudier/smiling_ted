Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teds do
    resources :chapters do
      resources :pages
    end
  end
  resources :profiles, only: [:show, :edit, :update, :delete]
end
