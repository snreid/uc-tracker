class RiskAssessment < ActiveRecord::Base
  belongs_to :risk_assessable, polymorphic: true
end
