class PictureController < ApplicationController

  before_action :authenticate_user, {only: [:create,:make,:edit]}
  before_action :ensure_correct_user, {only: [:create,:make,]}
  before_action :ensure_correct_user_id, {only: [:edit]}
  
  def make
    @user = User.find_by(id: params[:id])
    @picture =Picture.new
  end

  def create
    @user=User.find_by(id: params[:id])
    @picture=Picture.new(
       title: params[:title],
       coment: params[:coment],
       user_id: @user.id
    )
    
    if params[:image]
      image=params[:image]
      @picture.image_name="#{@picture.title}.#{@picture.user_id}.jpg"
      File.binwrite("public/images/#{@picture.image_name}",image.read)
    end
    
    if @picture.save
      flash[:notice] = "Timecapsuleを作成しました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "タイトル名または写真が未挿入です"
      render("picture/make")
    end
  end

  def image_edit
    @picture=Picture.find_by(id: params[:id])
    @user=@current_user
  end

  def update
    @picture = Picture.find_by(id: params[:id])
    @picture.title = params[:title]
    @picture.coment = params[:coment]
    @user=@current_user 
    if @picture.save
      flash[:notice] = "Timecapsuleを編集しました"
      redirect_to("/users/#{@picture.user.id}")
    else
      @error_message = "タイトル名が未入力です"
      render("picture/image_edit")
    end
  end

  def destroy
    @user=@current_user
    @picture=Picture.find_by(id: params[:id])
    @picture.destroy
    flash[:notice] = "Timecapsuleを削除しました"
    redirect_to("/users/#{@user.id}")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end

  def ensure_correct_user_id
    @picture=Picture.find_by(id: params[:id])
    if @current_user.id != @picture.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end

end
