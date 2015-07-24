class PhysicalActivity < ActiveRecord::Base
  belongs_to :user
  has_many :trackers, as: :trackable
  has_many :risk_assessments, as: :risk_assessable
end
