class AlbumController < ApplicationController
  before_action :authenticate_user, {only: [:create,:upload,:edit_message,:edit_album,:create_album]}
  before_action :ensure_correct_user, {only: [:create,:upload,:edit_message]}
  before_action :upload_image, {only: [:edit_message,:edit_album,:create_album]}
  before_action :ensure_correct_creater, {only: [:edit_album,:create_album, :preview]}
  # before_action :currect_album_acssecer, {only: [:creation_screen]}
  

  def create
    @user = User.find_by(id: params[:id])
    
    
  end

  def edit_message
    @user = User.find_by(id: params[:id])
    @album = Album.new
  end

  def album
    @user = User.find_by(id: params[:id])
    @album = Album.new(user_id: @user.id, title: params[:title], target_for: params[:target_for], message: params[:message], status: "none")

    if @album.save
      redirect_to("/album/#{@album.id}/edit_album")
    else
      @error_message = "記入漏れがあります"
      render("album/edit_message")
    end
  
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @user = @current_user
    @album.destroy
    redirect_to("/album/#{@user.id}/edit_message")
  end

  def delete
    @album = Album.find_by(id: params[:id])
    @detail = Detail.find_by(album_id: @album.id)
    @user = @current_user
    @album.destroy
    @detail.destroy
    redirect_to("/users/#{@user.id}/user_top")
  end
  

  def upload
    @user = User.find_by(id: params[:id])
    @images = Image.where(user_id: @user.id)
  end

  def edit_album
    # @user = User.find_by(id: params[:id])
     @album = Album.find_by(id: params[:id])
     @user = @current_user
     @layout = params[:layout]
  end

  def create_album
    # @user = User.find_by(id: params[:id])
     @album = Album.find_by(id: params[:id])
     @user = @current_user
     @images = Image.where(user_id: @user.id)
     @layout = params[:layout]
     @image_date = params[:image_date]
     unless @layout.to_i == 1 || @layout.to_i == 2 || @layout.to_i == 3
      flash[:notice] = "背景を指定してください"
      redirect_to("/album/#{@album.id}/edit_album")
     end
  end

  def preview
    @album = Album.find_by(id: params[:id])
    @user = @current_user
    @layout = params[:layout]
    @image_date = params[:image_date]
    @layout_offset_top = params[:layout_offset_top]
    @layout_offset_left = params[:layout_offset_left]
    @layout_height = params[:layout_height]
    @layout_width = params[:layout_width]
    if @image_date.blank?
      flash[:notice] = "レイアウトが作成されていません"
      
      redirect_to("/album/#{@album.id}/create_album")
    end
   
  end

  def creation_screen
    @album = Album.find_by(id: params[:id])
    require "json"
    @details = Detail.find_by(album_id: @album.id)
    @detail = JSON.parse(@details.img_date)
    @user = @current_user
  end

  def confirm_email
    @album = Album.find_by(id: params[:id])
    @user=@current_user

    if @album.present?
      # MakeMailer.confirm_email(@user,@album).deliver
      @album.status = "stand_by"
      @album.send_time = params[:send_time]
      @album.save
      redirect_to("/users/#{@user.id}/user_top")
      flash[:notice] = "Timecapsule【title:#{@album.title}】を送信しました"
    end 
  end

  def self.batch
    if Album.send_date?.present?
      Album.send_date?.each do |album|
       MakeMailer.send_the_album(album).deliver
       album.status = "completion"
       album.save
      end
    end 
  end

  def favarite
    @user=@current_user
    @album=Album.find_by(id: params[:id])
    @album.favorite = @album.id
    @album.save
    redirect_to("/users/#{@user.id}/user_top")
  end

  def favarite_destroy
    @user=@current_user
    @album=Album.find_by(id: params[:id])
    @album.favorite = nil
    @album.save
    redirect_to("/users/#{@user.id}/user_top")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}/user_top")
    end
  end

  def upload_image
    @images = Image.where(user_id: @current_user.id)
    unless @images.present?
      flash[:notice] = "写真をアップロードしてください"
      redirect_to("/album/#{@current_user.id}/create")
    end
  end

  def ensure_correct_creater
    @album = Album.find_by(id: params[:id])
    referer = request.env['HTTP_REFERER']
    if @album.blank? || @album.user_id != @current_user.id || referer.blank?
      flash[:notice] = "リンク先が正しくありません"
      redirect_to("/users/#{@current_user.id}/user_top")
    end
  end

  def currect_album_acssecer
    @album = Album.find_by(id: params[:id])
    @user =@current_user
    if params[:pass2] == @album.title && params[:pass] == @album.message
     redirect_to("/album/#{@album.id}/creation_screen")
    else
     flash[:notice] = "権限がありません"
     redirect_to("/")
    end
  end

end
