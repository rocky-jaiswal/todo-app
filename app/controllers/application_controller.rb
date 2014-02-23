class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  private

  def authenticate_user_from_token!
    auth_service = AuthenticationService.new
    user = auth_service.authenticated?(request.headers["email"], request.headers["token"])
    sign_in user, store: false if user
  end
end
