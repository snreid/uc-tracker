class Tracker < ActiveRecord::Base
  belongs_to :trackable, polymorphic: true
end
