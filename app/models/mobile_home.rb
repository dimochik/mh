class MobileHome < ActiveRecord::Base
  has_one :address, as: :addressable, dependent: :destroy
  belongs_to :owner
  has_one :county, through: :address
  has_one :metro_area, through: :county
  has_one :metro_area_stat, through: :metro_area
  has_one :county_area_stat, through: :county

  accepts_nested_attributes_for :address

  scope :by_state, ->(state) {where(state: state)}
  scope :with_owner, -> { joins(:owner)}
  scope :without_owner, -> { where(owner_id: nil)}
  scope :unique, -> { includes(:metro_area_stat, :county_area_stat).where(duplicate: [nil, false])}

  #scope :meets_metro_criteria, ->

  def full_address
    address.full_address
  end

  def area_stat
    metro_area_stat || county_area_stat
  end
end