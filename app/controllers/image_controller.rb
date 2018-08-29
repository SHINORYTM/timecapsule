class ImageController < ApplicationController

  def registration
    @user = User.find_by(id: params[:id])
    @image = Image.new(  
      user_id: @user.id,
      image: params[:file]
    )
    @image.save   
  end 

  def destroy
    @user=@current_user
    @image = Image.find_by(id: params[:id])
    if @image.present?
       @image.destroy
       flash[:notice] = "写真を削除しました"
       redirect_to("/album/#{@user.id}/upload")
    end
  end



end
