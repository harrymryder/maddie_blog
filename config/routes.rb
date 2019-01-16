Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users, :skip => [:registrations]

  as :user do
    get 'login', to: 'devise/sessions#new', as: :login
  end

  root to: 'pages#home'

  get 'about', to: 'pages#about', as: :about

  resources :articles
  resources :books, except: [:show]
  resources :films, except: [:show]

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end
