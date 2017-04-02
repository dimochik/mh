class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  belongs_to :county
end


