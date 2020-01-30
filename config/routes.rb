Rails.application.routes.draw do
  get 'users/annonces'
  post 'users/annonces', to: 'users#annonces'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'services', to: 'pages#services', as: :services

  get "specialites", to: "pages#specialites", as: :specialites
  get "contact", to: "pages#contact", as: :contact
  get "infos", to: "pages#infos", as: :infos
  get "nous_rejoindre", to: "pages#nous_rejoindre", as: :nous_rejoindre
  get "cotations", to: "pages#cotations", as: :cotations
  get "mentions_legales", to: "pages#mentions_legales", as: :mentions_legales

end
