require 'rails_helper'

RSpec.describe TransferHistory, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:source_account_id) }
    it { is_expected.to validate_presence_of(:destination_account_id) }
  end
end
