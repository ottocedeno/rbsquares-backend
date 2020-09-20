class Game < ApplicationRecord
  belongs_to :user
  validates :bet_amount, presence: true
  validates :matching_square, inclusion: { in: [ true, false ] }
  validates :matching_color, inclusion: { in: [ true, false ] }
  validates :payout, presence: true

  def update_user_balance
    if payout > 0
      user.balance += payout
    else
      user.balance -= bet_amount
    end
    user.save
  end
end
