Rails.application.routes.draw do
  get 'home/index'
  # フォームの表示
  get '/form', to: 'form#index'
  # フォームの送信（POST）
  post '/form', to: 'form#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
