Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'services', to: 'pages#services', as: :services

  get "specialites", to: "pages#specialites", as: :specialites
  get "contact", to: "pages#contact", as: :contact
  get "infos", to: "pages#infos", as: :infos
end
