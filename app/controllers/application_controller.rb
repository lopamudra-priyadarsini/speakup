class ApplicationController < ActionController::Base

  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_user!, :set_current_user
  def set_current_user
    return nil unless request.headers['uid'].present? # TODO remove this extra check
    access_token = request.headers['access_token'].presence || request.headers['access-token']
    current_user_data = {
        'uid' => request.headers['uid'],
        'access_token' => access_token,
        'client' => request.headers['client']
    }
    return true unless current_user.present?
    current_user_data.merge!(current_user.as_json)
    Thread.current[:current_user] = current_user_data
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :name, :uid, :password, :password_confirmation)}
  end

end