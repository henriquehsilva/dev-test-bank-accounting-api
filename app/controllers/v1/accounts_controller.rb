module V1
  class AccountsController < ApplicationController
    before_action :source_account,
                  :destination_account,
                  :valid_amount,
                  :source_customer,
                  only: :transfer

    def initialize
      @error_message = []
    end

    def transfer
      begin
        @source_account.transfer(@destination_account, @amount)
        transfer_history
      rescue StandardError => e
        @error_message.push(e.message)
        @status_code ||= :failed_dependency
      end
      render status: @status_code
    end

    def show
    end

    private

    def transfer_params
      params.require(:transfer).permit(:source_account_id, :destination_account_id, :amount)
    end

    def source_account
      @source_account ||= account_find_by_number(transfer_params[:source_account_id])
    end

    def destination_account
      @destination_account ||= account_find_by_number(transfer_params[:destination_account_id])
    end

    def account_find_by_number(number)
      Account.find_by(number: number)
    end

    def source_customer
      @source_customer ||= @source_account.customer if @source_customer
    end

    def transfer_history
      @transfer_history ||= TransferHistory.create(
        source_account_id: transfer_params[:source_account_id],
        destination_account_id: transfer_params[:destination_account_id],
        value: transfer_params[:amount]
      ).slice(
        :source_account_id,
        :destination_account_id,
        :value,
        :created_at
      )
    end

    def valid_amount
      @amount = transfer_params[:amount].to_i
      if @amount.negative?
        @error_message.push(I18n.t('account.error.negative_amount'))
        @status_code ||= :failed_dependency
      end
    end
  end
end
