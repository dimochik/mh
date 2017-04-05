class County < ActiveRecord::Base
  include MetroHelper

  has_one :county_area_stat, as: :informable, class_name: "AreaStat"
  belongs_to :metro_area
  belongs_to :state
  has_many :addresses
  accepts_nested_attributes_for :county_area_stat


  def self.find_county_by_name_and_state(county_name, state_name)
    joins(:state).where("lower(states.name) = ? AND lower(counties.name) = ?",state_name.downcase, county_name.downcase ).first
  end
end