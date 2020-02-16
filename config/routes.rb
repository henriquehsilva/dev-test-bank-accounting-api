Rails.application.routes.draw do
  namespace :v1 do
    post '/accounts/transfer', to: 'accounts#transfer', as: :accounts_transfer
    get '/accounts', to: 'accounts#consult', as: :accounts_consult

    resources :transfer_history, only: %i(show create)
  end
end
