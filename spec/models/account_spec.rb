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

  describe 'public methods' do
    subject { FactoryBot.create(:account) }

    context 'instance' do
      let(:destination_account) { FactoryBot.create(:account) }

      it '#transfer' do
        expect(subject.transfer(destination_account, 300)).to eq(destination_account.amount)
      end

      it '#credit' do
        expect(destination_account.credit(300)).to eq(destination_account.amount)
      end

      it '#debit' do
        expect(subject.debit(300)).to eq(subject.amount)
      end
    end

    context 'Class' do
      it '#account_exists?' do
        subject.class.send(:account_exists?, subject.number)
      end
    end
  end

  describe 'private methods' do
    context 'instance' do
      it '#generate_account_number' do
        subject.send(:generate_account_number)
      end
    end
  end
end
