class MetroArea < ActiveRecord::Base
  has_one :area_stat, as: :informable
  has_many :counties
  belongs_to :state
  accepts_nested_attributes_for :area_stat

  #overview includes: population, median_home_price, unemployment
  OVERVIEW_URL = "http://www.bestplaces.net/metro/:state/:metro"

  #housing includes: house_vacancy
  HOUSING_URL = "http://www.bestplaces.net/housing/metro/:state/:metro"

  #economy includes: household_income, future_job_growth
  ECONOMY_URL = "http://www.bestplaces.net/economy/metro/:state/:metro"

  def overview_url
    #http://www.bestplaces.net/economy/metro/idaho/twin_falls
    prepare_url(OVERVIEW_URL)
  end

  def economy_url
    #http://www.bestplaces.net/economy/metro/idaho/coeur_d'alene
    prepare_url(ECONOMY_URL)
  end

  def housing_url
    #http://www.bestplaces.net/housing/metro/idaho/coeur_d'alene
    prepare_url(HOUSING_URL)
  end

  private
  def prepare_url(pattern)
    pattern.gsub(':state', state.name.gsub(" ", "_").downcase).gsub(':metro', name.gsub(" ", "_").downcase)
  end
end