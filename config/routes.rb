Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]

  as :user do
    get 'login', to: 'devise/sessions#new', as: :login
  end

  root to: 'pages#home'

  get 'about', to: 'pages#about', as: :about
  get 'articles', to: 'pages#articles', as: :articles
  get 'books', to: 'pages#books', as: :books
  get 'film', to: 'pages#film', as: :film
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
