json.extract! npi_record, :id, :created_at, :updated_at
json.url npi_record_url(npi_record, format: :json)
