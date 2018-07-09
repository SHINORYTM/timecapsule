Rails.application.routes.draw do

  #home top
  get '/' => "home#top"
  get "about" => "home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #users
  get "signup" =>"users#new"
  get "login" => "users#login_form"
  get 'users/index'
end
