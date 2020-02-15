class TransferHistory < ApplicationRecord
  validates :source_account_id,
            :destination_account_id,
            presence: true
end
