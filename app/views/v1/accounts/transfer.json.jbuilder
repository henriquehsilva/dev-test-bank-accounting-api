!@error_message.empty? ? json.partial!('transaction_error') : json.transfer_history(@transfer_history)
