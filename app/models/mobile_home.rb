class MobileHome < ActiveRecord::Base
  has_one :address, as: :addressable, dependent: :destroy
  belongs_to :owner
  has_one :county, through: :address

  accepts_nested_attributes_for :address

  scope :by_state, ->(state) {where(state: state)}
  scope :with_owner, -> { joins(:owner)}
  scope :without_owner, -> { where(owner_id: nil)}
  scope :not_duplicate, -> { where(duplicate: [nil, false])}


  def full_address
    address.full_address
  end
end