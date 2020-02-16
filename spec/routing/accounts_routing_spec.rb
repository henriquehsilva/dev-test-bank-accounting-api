require 'rails_helper'

RSpec.describe 'routes for V1 of Accounts', type: :routing do
  it { expect(post('/v1/accounts/transfer')).to route_to('v1/accounts#transfer') }
  it { expect(get('/v1/accounts')).to route_to('v1/accounts#consult') }
end
