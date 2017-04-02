class State < ActiveRecord::Base
  has_one :area_stat, as: :informable
  has_many :metro_areas
  has_many :counties, through: :metro_areas
end