json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :title, :total, :status
  json.url transaction_url(transaction, format: :json)
end
