class ApiController < ActionController::API
  # TODO: bcypt
  def sign_up
    response = {
      user: @user.attributes.slice(:email),
      api_key: @user.api_key
    }
    if @user.save?
      render json: response
    else
      render json: 400
    end
  end
end
