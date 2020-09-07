class AuthController < ApplicationController

  def create
    user = User.find_by(username: user_login_params[:username])

    if user && user.authenticate(user_login_params[:password])
      render json: {user: UserSerializer.new(user)}, status: :ok
    else
      render json: {message: "Sorry, your credentials are invalid"}, status: :unauthorized
    end
    
  end

  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end
