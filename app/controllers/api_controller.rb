class ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate, except: [:login, :sign_up]

  def current_user
    @current_user
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      user_api_key, app_api_key = token.scan(/.{32}/)
      puts user_api_key, app_api_key
      @current_user = User.find_by(api_key: user_api_key)
      @current_user && app_api_key == ENV["APP_API_KEY"]
    end
  end
end
