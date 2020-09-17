class Game < ApplicationRecord
  belongs_to :user
  before_save :update_user_balance
  validates :bet_amount, presence: true
  validates :matching_square?, presence: true
  validates :matching_color?, presence: true
  validates :payout, presence: true

  def update_user_balance
    user.balance += payout if payout > 0
  end
end
