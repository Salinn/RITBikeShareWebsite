json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :date_of_charge, :charge_amount, :description_of_charge, :pending, :user_id
  json.url transaction_url(transaction, format: :json)
end
