json.array!(@maintenance_reports) do |maintenance_report|
  json.extract! maintenance_report, :id
  json.url maintenance_report_url(maintenance_report, format: :json)
end
