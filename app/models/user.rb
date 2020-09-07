class User < ApplicationRecord
  has_secure_password
  after_initialize :default_values
  validates :username, presence: true
  validates :username, uniqueness: true

  private 

  def default_values
    self.balance = 500
    self.winstreak = 0
  end
end
