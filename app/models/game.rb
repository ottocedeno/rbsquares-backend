class Game < ApplicationRecord
  belongs_to :user
  before_save update_user_balance

  def update_user_balance
    user.balance += payout if payout > 0
  end
end
