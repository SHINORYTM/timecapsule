class DetailController < ApplicationController

  def create
    require "json"

    @user = @current_user
    @album = Album.find_by(id: params[:id])
    #@image_date = params[:image_date]
    #strongp = params.require(:image_date).permit(:id, :top, :left, :height, :width)
    #@date = image_params.keys.map {|date| image_params[date]}
    @image_date = params[:image_date]
    # image_date = @image_date.keys.map { |date| @image_date[date].keys.map{ |date2| @image_date[date][date2] } }
    
    format_date = Hash.new()
    @image_date.each do |key, date|
      format_date[key] = Hash.new()
      date.each do |key2, date2|
        format_date[key][key2] = date2
      end
    end
    # logger.unknown(format_date)

    @img_date = JSON.generate(format_date)
    
      @detail = Detail.new(img_date: @img_date,layout: params[:layout], album_id: @album.id)
      @detail.save
      redirect_to("/users/#{@user.id}/user_top")
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @detail = Detail.where(album_id: @album.id)
    @detail.destroy
    redirect_to ("/album/#{@album.id}/edit_album")
  end

  #private

  #def image_params
    #params.permit(image_date: [])
  #end
end
