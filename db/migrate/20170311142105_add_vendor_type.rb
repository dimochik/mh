class AddVendorType < ActiveRecord::Migration
  def self.up
    rename_column :mobile_homes, :mhbay_url, :vendor_url unless column_exists? :mobile_homes, :vendor_url
    rename_column :mobile_homes, :mhbay_id, :vendor_id unless column_exists? :mobile_homes, :vendor_id
    add_column    :mobile_homes, :vendor_name, :string unless column_exists? :mobile_homes, :vendor_name
  end

  def self.down
    rename_column :mobile_homes, :vendor_url, :mhbay_url if column_exists? :mobile_homes, :vendor_url
    rename_column :mobile_homes, :vendor_id, :mhbay_id if column_exists? :mobile_homes, :vendor_id
    remove_column :mobile_homes, :vendor_name if column_exists? :mobile_homes, :vendor_name
  end
end