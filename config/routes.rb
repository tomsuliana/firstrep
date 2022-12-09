Rails.application.routes.draw do
  root "session#login"
  post 'session/authorize'
  get 'session/logout'
  resources :users
  get 'example/input'
  post 'example/show', as: 'result'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
