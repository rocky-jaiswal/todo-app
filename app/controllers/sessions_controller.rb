class SessionsController < Devise::SessionsController

  skip_before_filter :authenticate_user_from_token!, :only => [:create]
  
  def create
    return failure unless params[:user] && params[:user][:email]
    user = User.find_for_database_authentication(email: params[:user][:email])
    return failure unless user
    return failure unless user.valid_password?(params[:user][:password])
    handle_success(user)
  end
 
  def failure
    current_user.logout
    render :nothing => true, :status => :unauthorized
  end

  def destroy
    current_user.logout
    render :json => {:success => true, :message => "logged out"}
  end

  private
  def handle_success(resource)
    token = resource.ensure_authentication_token
    email = AES.encrypt(resource.email, TodoApp::Application.config.secret_token)
    render :json => {:success => true, :email => email, :token => token}
  end

end