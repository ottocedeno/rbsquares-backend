class User < ApplicationRecord
  has_secure_password
  has_many :games
  before_create :default_values
  validates :username, presence: true
  validates :username, uniqueness: true

  def self.sort_by_balance
    User.order('balance DESC')
  end

  private 

  def default_values
    self.balance = 1200
    self.winstreak = 0
  end
end
