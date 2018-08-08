class PictureController < ApplicationController

  before_action :authenticate_user, {only: [:create,:make,:image_edit]}
  before_action :ensure_correct_user, {only: [:create,:make]}
  before_action :ensure_correct_user_id, {only: [:image_edit]}
  before_action :currect_acssecer, {only: [:image_show]}
  
  def make
    @user = User.find_by(id: params[:id])
    @picture =Picture.new
  end

  def self.batch
    if Picture.send_date?.present?
      Picture.send_date?.each do |picture|
       MakeMailer.send_the_work(picture).deliver
       picture.status = "completion"
       picture.save
      end
    end 
  end

  def confirm_mail
    @picture=Picture.find_by(id: params[:id])
    @user=@current_user

    if @picture.present?
      MakeMailer.confirm_mail(@user,@picture).deliver
      @picture.status = "stand_by"
      @picture.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "Timecapsule【title:#{@picture.title}】を送信しました"
    end 
  end

  def currect_acssecer
    @picture = Picture.find_by(id: params[:id])
    @user =@current_user
    if params[:pass2] == @picture.title && params[:pass] == @picture.image_name
     render("picture/image_show")
    else
     flash[:notice] = "権限がありません"
     redirect_to("/")
    end
  end

  def create
    @user=User.find_by(id: params[:id])
    @picture=Picture.new(
       title: params[:title],
       coment: params[:coment],
       user_id: @user.id,
       sent_email: params[:sent_email],
       send_time: params[:send_time]
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
      @error_message = "正しく記入してください"
      render("picture/make")
    end
  end

  def image_show
    @picture=Picture.find_by(id: params[:id])
    @user=@current_user
  end

  def image_edit
    @picture=Picture.find_by(id: params[:id])
    @user=@current_user
  end

  def update
    @picture = Picture.find_by(id: params[:id])
    @picture.title = params[:title]
    @picture.coment = params[:coment]
    @picture.sent_email=params[:sent_email]
    @picture.send_time = params[:send_time]
    @user=@current_user 

    if @picture.save
      flash[:notice] = "Timecapsuleを編集しました"
      redirect_to("/users/#{@picture.user.id}")
    else
      @error_message = "記入漏れがあります"
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

  def favarite
    @user=@current_user
    @picture=Picture.find_by(id: params[:id])
    @picture.favarite = @picture.id
    @picture.save
    redirect_to("/users/#{@user.id}")
  end

  def favarite_destroy
    @user=@current_user
    @picture=Picture.find_by(id: params[:id])
    @picture.favarite = nil
    @picture.save
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
