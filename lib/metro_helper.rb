module MetroHelper
  POPULATION = 50000.freeze
  HOME_PRICE = 80000.freeze
  HOUSEHOLD_INCOME = 35000.freeze
  HOUSE_VACANCY = 20.freeze
  UNEMPLOYMENT = 8.freeze

  #overview includes: population, median_home_price, unemployment
  OVERVIEW_URL = "http://www.bestplaces.net/:type/:state/:metro"

  #housing includes: house_vacancy
  HOUSING_URL = "http://www.bestplaces.net/housing/:type/:state/:metro"

  #economy includes: household_income, future_job_growth
  ECONOMY_URL = "http://www.bestplaces.net/economy/:type/:state/:metro"

  def overview_url(type = "county")
    #http://www.bestplaces.net/economy/metro/idaho/twin_falls
    prepare_url(OVERVIEW_URL, type)
  end

  def economy_url(type = "county")
    #http://www.bestplaces.net/economy/metro/idaho/coeur_d'alene
    prepare_url(ECONOMY_URL, type)
  end

  def housing_url(type = "county")
    #http://www.bestplaces.net/housing/metro/idaho/coeur_d'alene
    prepare_url(HOUSING_URL, type)
  end

  private
  def prepare_url(pattern, type)
    pattern.gsub(':state', state.name.gsub(" ", "_").downcase).gsub(':metro', name.gsub(" ", "_").downcase).gsub(':type', type)
  end
end