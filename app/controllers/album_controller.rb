class AlbumController < ApplicationController

  def create
    @user = User.find_by(id: params[:id])
    @album =Album.new
  end

  

  def upload
    @user = User.find_by(id: params[:id])
    @album =Album.find_by(user_id: @user.id)
  end

  def edit_album
    @user = User.find_by(id: params[:id])
    @album =Album.find_by(user_id: @user.id)
  end

  def create_album
    @user = User.find_by(id: params[:id])
    @album =Album.find_by(user_id: @user.id)
  end

end
