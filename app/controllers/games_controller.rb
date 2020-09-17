class GamesController < ApplicationController
  def create
    game = current_user.games.build(game_params)
    if game.save
      render json: {user: UserSerializer.new(game.user), jwt: token}, status: :accepted
    else
      render json: {message: "Uh oh. That game didn't save."}, status: :not_acceptable
    end
    #custom method to update user balance based on payout
  end

  def game_params
    params.require(:game).permit(:bet_amount, :matching_square?, :matching_color?, :payout)
  end
end
