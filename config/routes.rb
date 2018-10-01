Rails.application.routes.draw do

  get 'album/create'
  get 'image/create'
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
  #test-up
  get "users/:id/user_top" => "users#user_top"
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
  get "picture/:id/image_show" => "picture#image_show"
  get "picture/:id/confirm_mail" => "picture#confirm_mail"
  post "picture/:id/favarite" => "picture#favarite"
  post "picture/:id/favarite_destroy" => "picture#favarite_destroy"
  
  #album
  get "album/:id/create" => "album#create"
  get "album/:id/upload" => "album#upload"
  get "album/:id/edit_message" => "album#edit_message" 
  get "album/:id/edit_album" => "album#edit_album"
  get "album/:id/create_album" => "album#create_album"
  get "album/:id/preview" => "album#preview"
  get "album/:id/creation_screen" => "album#creation_screen"
  get "album/:id/confirm_email" => "album#confirm_email"
  post "album/:id/album" => "album#album"
  post "album/:id/destroy" => "album#destroy"
  post "album/:id/delete" => "album#delete"
  post "album/:id/favarite" => "album#favarite"
  post "album/:id/favarite_destroy" => "album#favarite_destroy"
  post "album/:id/stop_create_album" => "album#stop_create_album"

  #image
  post "image/:id/registration" => "image#registration"
  post "image/:id/destroy" => "image#destroy"

  #detail
  post "detail/:id/create" => "detail#create"
  post "detail/:id/destroy" => "detail#destroy"
  
end
