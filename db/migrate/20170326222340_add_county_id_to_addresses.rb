class AddCountyIdToAddresses < ActiveRecord::Migration
  def self.up
    add_column    :addresses, :county_id, :integer unless column_exists? :addresses, :county_id
  end

  def self.down
    remove_column :addresses, :county_id if column_exists? :mobile_homes, :county_id
  end
end
