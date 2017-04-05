class MetroArea < ActiveRecord::Base
  include MetroHelper

  has_one :metro_area_stat, as: :informable, class_name: "AreaStat"
  has_many :counties
  belongs_to :state
  accepts_nested_attributes_for :metro_area_stat

#  scope :meets_criteria, joins(:area_stat).where("area_stats.population > 50000")
end