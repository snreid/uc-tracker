class Food < ActiveRecord::Base
  belongs_to :user
  has_many :trackers, as: :trackable
  has_many :risk_assessments, as: :risk_assessable
  

  def get_usda_nutrition_facts
    api = USDA::FoodAPI.new
    api.reports({ndbno: self.usda_ndbno})
  end  
end
