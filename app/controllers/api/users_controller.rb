class Api::UsersController < ApiController
  before_action :set_user, only: [:show, :update]

  def show
    response = {
      user: { nickname: @user.attributes.slice(:nickname),
              api_key: @user.attributes.slice(:api_key) }
    }
    render json: response
  end

  def update
    response = {
      user: { name: @user.attributes.slice(:name),
              email: @user.attributes.slice(:email) }
    }
    if @user.update(user_params)
      render json: response
    else
      render json: @user.errors
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
