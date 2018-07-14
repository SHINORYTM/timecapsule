Rails.application.routes.draw do

  #home
  get '/' => "home#top"
  get "about" => "home#about"
  get "how_to_use" => "home#how_to_use"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #users
  get "signup" =>"users#new"
  post "users/create" =>"users#create"
  get "login" => "users#login_form"
  get 'users/index'
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"

  #create

end
