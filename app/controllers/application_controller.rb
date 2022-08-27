class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_with_token
  before_action :authenticate_user!

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :image, :bio, :posts_counter, :email, :password, :role)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :image, :bio, :posts_counter, :email, :password, :current_password)
    end
  end

  private

  def authenticate_with_token
    return unless params[:api_token]

    user = User.find_by_api_token(params[:api_token])
    sign_in(user)
  end
end
