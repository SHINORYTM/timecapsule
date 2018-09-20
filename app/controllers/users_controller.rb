class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:show, :edit, :update, :how_to_use]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update, :show, :how_to_use]}

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
      session[:user_id] = @user.id
      flash[:notice] = "アカウント登録が完了しました"
      redirect_to("/users/#{@user.id}/user_top")
      MakeMailer.create_account(@user).deliver
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password =params[:password]
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}/user_top")
      MakeMailer.update_account(@user).deliver
    else
      render("users/edit")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @pictures=Picture.where(user_id: @user.id)
    @pictures_none = Picture.where(user_id: @user.id, status: "none")
    @pictures_stand_by = Picture.where(user_id: @user.id, status: "stand_by")
    @pictures_completion = Picture.where(user_id: @user.id, status: "completion")
    @pictures_favarite = Picture.where(user_id: @user.id) && Picture.where("favarite IS NOT NULL")
  end

  def user_top
    @user = User.find_by(id: params[:id])
    @albums = Album.where(user_id: @user.id)
    @albums_none = Album.where(user_id: @user.id, status: "none")
    @albums_stand_by = Album.where(user_id: @user.id, status: "stand_by")
    @albums_completion = Album.where(user_id: @user.id, status: "completion")
    @albums_favarite = Album.where(user_id: @user.id) && Album.where("favorite IS NOT NULL")
    #require "json"
    #@detail = Detail.where(id: album_id)
    #@json = JSON.parse(@detail.img_date)
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email],password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}/user_top")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}/user_top")
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:notice] = "アカウントを削除しました"
    redirect_to("/")
  end

  def how_to_use
    @user = User.find_by(id: params[:id])
  end

end
