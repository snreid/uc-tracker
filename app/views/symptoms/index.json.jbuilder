json.array!(@symptoms) do |symptom|
  json.extract! symptom, :id
  json.url symptom_url(symptom, format: :json)
end
