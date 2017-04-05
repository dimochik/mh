class AddStateToCounty < ActiveRecord::Migration
  def self.up
    add_column    :counties, :state_id, :integer unless column_exists? :counties, :state_id
  end

  def self.down
    add_column    :counties, :state_id, :string unless column_exists? :counties, :state_id
  end
end
