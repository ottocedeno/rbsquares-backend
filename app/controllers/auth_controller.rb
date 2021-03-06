class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def retrieve
    render json: {user: UserSerializer.new(current_user)}, status: :ok
  end

  def create
    user = User.find_by(username: user_login_params[:username])

    if user && user.authenticate(user_login_params[:password])
      token = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), jwt: token}, status: :accepted
    else
      render json: {message: "Sorry, your credentials are invalid"}, status: :unauthorized
    end
    
  end

  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end
