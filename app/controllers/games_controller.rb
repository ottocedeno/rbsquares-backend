class GamesController < ApplicationController
  def create
    #find the user
    #build a game with that user associated
    #custom method to update user balance based on payout
  end

  def game_params
    params.require(:game).permit(:bet_amount, :matching_square?, :matching_color?, :payout)
  end
end
