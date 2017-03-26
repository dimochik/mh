class MetroArea < ActiveRecord::Base
  has_one :area_info, as: :informable
  has_many :counties
  belongs_to :state

  #overview includes: population, median_home_price, unemployment
  OVERVIEW_URL = "http://www.bestplaces.net/metro/:state/:metro"

  #housing includes: house_vacancy
  HOUSING_URL = "http://www.bestplaces.net/housing/metro/:state/:metro"

  #economy includes: household_income, future_job_growth
  ECONOMY_URL = "http://www.bestplaces.net/economy/metro/:state/:metro"
end