Rails.application.routes.draw do
  get 'session/login'
  get 'session/authorize'
  get 'session/logout'
  resources :users
  root "example#input"
  post 'example/show', as: 'result'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
