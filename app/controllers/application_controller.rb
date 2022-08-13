class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?



  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'siduno' && password == '0127'
    end
  end
  
  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name_kannzi, :first_name_kannzi, :last_name_katakana, :first_name_katakana, :birthday])
  end

  def user_error_handling
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

end
