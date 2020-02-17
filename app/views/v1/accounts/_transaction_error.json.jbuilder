@error_message.map do |error|
  @credit_error   = error.match(/credit/)
  @debit_error    = error.match(/debit/)
  @transfer_error = error.match(/transfer/)
end

case
when @credit_error   then @error_message.push(t('account.error.credit'))
when @debit_error    then @error_message.push(t('account.error.debit'))
when @transfer_error then @error_message.push(t('account.error.transfer'))
end

json.array!(@error_message) { |message| json.error(message) }
