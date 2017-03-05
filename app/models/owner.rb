class Owner < ActiveRecord::Base
  has_many :mobile_homes
  has_one :address, as: :addressable

  accepts_nested_attributes_for :address
end