json.array!(@medications) do |medication|
  json.extract! medication, :id
  json.url medication_url(medication, format: :json)
end
