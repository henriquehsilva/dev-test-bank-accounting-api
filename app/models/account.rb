class Account < ApplicationRecord
  validates :number, uniqueness: true

  before_validation :generate_account_number

  private

  def generate_account_number
    self.number = rand.to_s[2..11] if number.blank?
  end
end
