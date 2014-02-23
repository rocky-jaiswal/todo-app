class AuthenticationService

  def authenticated?(encrypted_email, user_token)
    user = get_user_from_encrypted_email(encrypted_email)
    return user if valid_token?(user, user_token)
    false
  end

  def get_user_from_encrypted_email(encrypted_email)
    if encrypted_email && !encrypted_email.blank?
      user_email = AES.decrypt(encrypted_email, TodoApp::Application.config.secret_token)
      User.find_by_email(user_email)
    end
  end

  def valid_token?(user, user_token)
    user && !user_token.blank? && Devise.secure_compare(user.authentication_token, user_token)
  end

end