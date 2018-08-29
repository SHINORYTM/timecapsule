class DetailController < ApplicationController

  def create
    @album = Album.find_by(id: params[:id])
    @detail = Datail.new(layout: params[],
    album_id: @album.id,
    page: params[]
    )
    @detail.save
    redirect_to ("/album/#{@album.id}/create_album")
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @detail = Detail.where(album_id: @album.id)
    @detail.destroy
    redirect_to ("/album/#{@album.id}/edit_album")
  end

end
