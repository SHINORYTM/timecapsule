Rails.application.routes.draw do

  get 'picture/create'
  #home
  get '/' => "home#top"
  get "about" => "home#about"
  get "how_to_use" => "home#how_to_use"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #users
  get "signup" =>"users#new"
  post "users/create" =>"users#create"
  get "login" => "users#login_form"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"
  get "users/:id/how_to_use" => "users#how_to_use"

  #picture
  post "picture/:id/create" => "picture#create"
  get "picture/:id/make" => "picture#make"
  post "picture/:id/destroy" => "picture#destroy"
  get "picture/:id/image_edit" => "picture#image_edit"
  post "picture/:id/update" => "picture#update"

end
