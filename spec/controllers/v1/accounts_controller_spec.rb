require 'rails_helper'

RSpec.describe V1::AccountsController, type: :controller do
  render_views

  describe "POST #transfer" do
    let(:source_account) { FactoryBot.create(:account) }
    let(:destination_account) { FactoryBot.create(:account) }
    let(:params_of_transfer) do
      {
        transfer: {
          source_account_id: source_account.number,
          destination_account_id: destination_account.number,
          amount: 300
        },
        as: :json
      }
    end

    subject { post :transfer, params: params_of_transfer }

    it { binding.pry;is_expected.to be_success }

    it "returns json valid" do
      expect(response).to eq('sdasdsa')
    end
  end

  describe "GET #show" do
    xit "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end

