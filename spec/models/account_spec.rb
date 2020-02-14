require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:number) }
  end
end
