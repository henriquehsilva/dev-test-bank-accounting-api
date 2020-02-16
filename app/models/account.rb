class Account < ApplicationRecord
  belongs_to :customer

  validates :number, uniqueness: true
  validates :customer, presence: true

  before_validation :generate_account_number

  def transfer(destination_account, value)
    debit(value)
    destination_account.credit(value)
  end

  def credit(value)
    self.amount += value
    save
  end

  def debit(value)
    self.amount -= value
    save
  end

  private

  def generate_account_number
    self.number = rand.to_s[2..11] if number.blank?
  end
end
