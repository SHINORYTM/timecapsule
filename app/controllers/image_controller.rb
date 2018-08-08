class ImageController < ApplicationController

  def registration
    @user = User.find_by(id: params[:id])
    @image = Image.new({"image" => params.require(:file), "user_id" => @user.id})
  end  

end
