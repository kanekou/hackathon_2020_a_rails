class Api::AuthenticateController < ApiController
  def sign_up
    user = User.new(user_params)
    user.password_confirmation = user.password
    if user.save
      response = {
        user: user.attributes.slice("email", "api_key"),
      }
      render json: response
    else
      render plain: "bad requrest", status: 400
    end
  end

  def login
    user = User.find_by(email: params[:email])
    return render plain: "not found", status: 403

    if user.authenticate(params[:password])
      response = {
        user: user.slice("nickname", "email", "api_key")
      }
      render json: response
    else
      render plain: "not found", status: 403
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
