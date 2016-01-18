class AdminFacingController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin

  def ensure_user_is_admin
    unless current_user and current_user.is_admin
      redirect_to root_url(:subdomain => false), :notice => "Feel free to look around on our public site."
    end
  end
end
