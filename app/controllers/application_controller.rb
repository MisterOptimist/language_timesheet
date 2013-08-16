class ApplicationController < ActionController::Base
	include PublicActivity::StoreController
  def forem_user
    current_user
  end
  helper_method :forem_user

  protect_from_forgery

  config.time_zone = 'Bangkok'

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end




end
