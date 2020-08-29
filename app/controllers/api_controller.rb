class ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate, except: [:login, :sign_up]

  def current_user
    @current_user
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      @current_user = User.find_by(api_token: token)
    end
  end
end
