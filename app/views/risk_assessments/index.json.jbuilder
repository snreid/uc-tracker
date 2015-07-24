json.array!(@risk_assessments) do |risk_assessment|
  json.extract! risk_assessment, :id
  json.url risk_assessment_url(risk_assessment, format: :json)
end
