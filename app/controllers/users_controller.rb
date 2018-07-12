class UsersController < ApplicationController
  def index
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(
      name: params[:name], 
      email: params[:email], 
      password: params[:password]
      )
    if @user.save
      flash[:notice] = "アカウント登録が完了しました"
      redirect_to("/")
    else
      render("users/new")
    end
  end

  def login_form
  end
  
end
