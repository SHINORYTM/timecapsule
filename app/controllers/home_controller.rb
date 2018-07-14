class HomeController < ApplicationController

  before_action :forbid_login_user, {only: [:top, :about, :how_to_use]}

  def top
  end

  def about
  end
  
  def how_to_use
  end
end
