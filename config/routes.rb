Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]

  as :user do
    get 'login', to: 'devise/sessions#new', as: :login
  end

  root to: 'pages#home'

  get 'about', to: 'pages#about', as: :about

  # get 'edit_about', to: 'pages#edit_about', as: :about

  resources :articles
  resources :books, except: [:show]
  resources :films, except: [:show]

end
