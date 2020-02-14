class Customer < ApplicationRecord
  has_one :account, dependent: :destroy

  validates :name, presence: true

  before_create :to_assign_account

  private

  def to_assign_account
    self.account = Account.new
  end
end
