Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "books#top"
  get '/home/about', to: "books#about", as: "about"
  resources :books
  resources :users

end
