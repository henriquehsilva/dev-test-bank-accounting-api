Rails.application.routes.draw do
  namespace :v1,
  defaults: { format: :json },
  path: '/' do
    post '/accounts/transfer', to: 'accounts#transfer', as: :accounts_transfer
    get '/accounts', to: 'accounts#consult', as: :accounts_consult
  end
end
