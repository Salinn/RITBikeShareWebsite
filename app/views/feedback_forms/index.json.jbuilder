json.array!(@feedback_forms) do |feedback_form|
  json.extract! feedback_form, :id, :feedback
  json.url feedback_form_url(feedback_form, format: :json)
end
