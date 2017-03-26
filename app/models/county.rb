class County < ActiveRecord::Base
  has_one :area_info, as: :informable
  belongs_to :metro_area
end