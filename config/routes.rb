Rails.application.routes.draw do
  get 'sessions/new'
  root "static_pages#home"
  
  # get '/help', to: 'static_pages#help', as: 'help'
  get    '/help',  to: 'static_pages#help'
  get    '/about', to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users 
  # help_path -> '/help'

  # get 'help'"static_pages/help"
  # get "static_pages/about"
  # get "static_pages/contact"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
