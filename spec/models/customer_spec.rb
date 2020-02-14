require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { FactoryBot.build(:customer) }

  describe 'relationships' do
    it { is_expected.to have_one(:account) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'private methods' do
    it '#to_assign_account' do
      subject.send(:to_assign_account)
    end
  end
end
