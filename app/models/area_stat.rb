class AreaStat < ActiveRecord::Base
  belongs_to :informable, polymorphic: true
end