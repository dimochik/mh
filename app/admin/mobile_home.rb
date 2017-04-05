ActiveAdmin.register MobileHome do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  scope :unique, :default => true
  scope :owner_verified do |mh|
    mh.where("owner_verified IS TRUE")
  end

  scope :address_verified do |mh|
    mh.where("address_verified IS TRUE")
  end

  scope :with_owner

  filter :state
  filter :state, as: :select, collection: proc { State.all.collect(&:name) }
  #filter :vetted

  index do
    column("Id", :sortable => :id) {|mobile_home| link_to "#{mobile_home.id} ", mobile_home.vendor_url }
    column("Name", :park_name)
    column("State") {|mobile_home| status_tag(mobile_home.state) }
    column("# Lots", :number_of_lots)
    column("County") {|mobile_home| mobile_home.county }
    column("Metro Name"){|mobile_home| link_to "#{mobile_home.metro_area&.name}", mobile_home.area_stat&.link  }
    column("Population") do |mobile_home|
      population = mobile_home.area_stat&.population
      status_tag(number_with_delimiter(population), population.to_i > MetroHelper::POPULATION ? :ok : :error)
    end
    column("Median Home Price") do |mobile_home|
      median_home_price = mobile_home.area_stat&.median_home_price
      status_tag(number_to_currency(median_home_price), median_home_price.to_i > MetroHelper::HOME_PRICE ? :ok : :error)
    end
    column("Income") do |mobile_home|
      household_income = mobile_home.area_stat&.household_income
      status_tag(number_to_currency(household_income), household_income.to_i > MetroHelper::HOUSEHOLD_INCOME ? :ok : :error)
    end
    column("Vacancy") do |mobile_home|
      house_vacancy = mobile_home.area_stat&.house_vacancy
      status_tag(number_to_percentage(house_vacancy, precision: 2), house_vacancy.to_f > MetroHelper::HOUSE_VACANCY ? :error : :ok)
    end
    column("Unemployment") do |mobile_home|
      unemployment = mobile_home.area_stat&.unemployment
      status_tag(number_to_percentage(unemployment, precision: 2), unemployment.to_f > MetroHelper::UNEMPLOYMENT ? :error : :ok)
    end
    column("Future Job Growth"){|mobile_home| number_to_percentage(mobile_home.area_stat&.future_job_growth, precision: 2) }
    column("Address Verified", :address_verified)
    column("Owner Verified", :owner_verified)

    actions #:all, :except => [:destroy]
    # column("Total")                   {|order| number_to_currency order.total_price }
  end

end
