class County < ActiveRecord::Base
  has_one :area_stat, as: :informable
  belongs_to :metro_area
  has_one :state, through: :metro_area


  def self.find_county_by_name_and_state(county_name, state_name)
    joins(:metro_area => :state).where("lower(states.name) = ? AND lower(counties.name) = ?",state_name.downcase, county_name.downcase ).first
  end
end