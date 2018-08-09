class ImageController < ApplicationController

  def registration
    @user = User.find_by(id: params[:id])
    @image = Image.new(  
      user_id: @user.id
    )
    respond_to do |format|
      format.html
      format.
    end

    @image.save

  end  

end
