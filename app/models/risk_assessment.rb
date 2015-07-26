class RiskAssessment < ActiveRecord::Base
  belongs_to :risk_assessable, polymorphic: true

  scope :current, -> { order("created_at").last }

  
end
