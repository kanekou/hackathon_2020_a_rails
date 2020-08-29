class Api::UsersController < ApiController
  before_action :set_user, only: [:show, :update]

  def show
    response = {
      user: @user.attributes.slice("nickname", "email")
    }
    render json: response
  end

  def update
    response = {
      user: @user.attributes.slice("nickname", "email")
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
