class PictureController < ApplicationController

  before_action :authenticate_user, {only: [:create,:make]}
  before_action :ensure_correct_user, {only: [:create,:make]}

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
      @error_message = "タイトル名または写真が未入力です"
      render("picture/make")
    end
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end

end
