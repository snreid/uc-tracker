class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :foods
  has_many :stressors
  has_many :symptoms
  has_many :physical_activities
  has_many :medications
  has_many :trackers

end
