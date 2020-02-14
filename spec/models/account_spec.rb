require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:customer) { FactoryBot.create(:customer) }

  subject { FactoryBot.build(:account, customer_id: customer.id) }

  describe 'relationships' do
    it { is_expected.to belong_to(:customer) }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:number).case_insensitive }
    it { is_expected.to validate_presence_of(:customer) }
  end

  describe 'private methods' do
    it '#generate_account_number' do
      subject.send(:generate_account_number)
    end
  end
end
