class AreaInfo < ActiveRecord::Base
  has_one :area_info, as: :informable
  belongs_to :informable, polymorphic: true
end