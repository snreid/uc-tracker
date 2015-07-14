json.array!(@physical_activities) do |physical_activity|
  json.extract! physical_activity, :id
  json.url physical_activity_url(physical_activity, format: :json)
end
