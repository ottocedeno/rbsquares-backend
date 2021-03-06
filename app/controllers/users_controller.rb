class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    users = User.sort_by_balance
    render json: {users: UserSerializer.new(users)}, status: :ok
  end

  def create
    user = User.create(user_params)
    
    if user.valid?
      token = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), jwt: token}, status: :created
    else
      render json: {message: 'Cannot create that username, try again.'}, status: :not_acceptable
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
