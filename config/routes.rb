Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :v1 do
    resources :accounts, only: %i(transfer consult) do
      collection do
        post :transfer
        get :consult
      end
    end
  end
end
