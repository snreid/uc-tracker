class Medication < ActiveRecord::Base
  belongs_to :user
  has_many :trackers, as: :trackable
end
