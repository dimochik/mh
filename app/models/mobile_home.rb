class MobileHome < ActiveRecord::Base
  has_one :address, as: :addressable
  belongs_to :owner

  accepts_nested_attributes_for :address

end