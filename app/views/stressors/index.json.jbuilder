json.array!(@stressors) do |stressor|
  json.extract! stressor, :id
  json.url stressor_url(stressor, format: :json)
end
