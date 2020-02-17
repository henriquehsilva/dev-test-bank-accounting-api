require 'rails_helper'

RSpec.describe V1::AccountsController, type: :controller do
  render_views
  subject { response }

  let(:content_type) { subject.content_type }
  let(:body) { JSON.parse(subject.body) }
  let(:error_message) { body.pluck('error') }

  describe "POST #transfer" do
    before(:each) { post :transfer, params: input_params }

    let(:accounts) { FactoryBot.create_list(:account, 2) }
    let(:source_account) { accounts.first }
    let(:destination_account) { accounts.last }

    let(:input_params) { { transfer: data_transfer } }

    context 'valid request' do
      let(:data_transfer) do
        {
          source_account_id: source_account.number,
          destination_account_id: destination_account.number,
          amount: 300,
        }
      end

      it { expect(content_type).to eq('application/json; charset=utf-8') }
      it { is_expected.to match_response_schema(:transfer_history) }
      it { is_expected.to have_http_status(:ok) }
    end

    context 'invalid request' do
      let(:data_transfer) do
        {
          source_account_id: Faker::Number.number(digits: 10),
          destination_account_id: Faker::Number.number(digits: 10),
          amount: -300,
        }
      end

      it { expect(error_message).to include(I18n.t('account.error.transfer')) }
      it { expect(error_message).to include(I18n.t('account.error.negative_amount')) }
      it { is_expected.to have_http_status(:failed_dependency) }
    end
  end

  describe "GET #show" do
    xit "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
