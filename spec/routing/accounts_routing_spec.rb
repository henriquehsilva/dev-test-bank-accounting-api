require 'rails_helper'

RSpec.describe 'routes for Accounts', type: :routing do
  it { expect(post('/accounts/transfer')).to route_to('v1/accounts#transfer', format: :json) }
  it { expect(get('/accounts')).to route_to('v1/accounts#consult', format: :json) }
end
