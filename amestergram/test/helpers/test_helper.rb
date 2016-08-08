ENV['RAILS_ENV'] ||= 'test'


class ActiveSupport::TestCase
  fixtures :all

  # テストユーザーがログインしていればtrueを返す
  def is_logged_in?
    !session[:user_id].nil?
  end


  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def log_in_as(user, options={})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session:{email: user.email,
                                password: password,
                                remember_me: remember_me}
    else
      session[:user_id] = user.id
    end
  end

  def integration_test?
    defined?(post_via_redirect)
  end
end