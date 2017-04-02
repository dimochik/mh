class AddFieldsToMobileParks < ActiveRecord::Migration
  def self.up
    add_column    :owners, :second_owners_name, :string unless column_exists? :owners, :second_owners_name
    add_column    :owners, :corporate_owner_name, :string unless column_exists? :owners, :corporate_owner_name
  end

  def self.down
    add_column    :owners, :second_owners_name, :string unless column_exists? :owners, :second_owners_name
    add_column    :owners, :corporate_owner_name, :string unless column_exists? :owners, :corporate_owner_name
  end
end
