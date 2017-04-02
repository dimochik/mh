class AddVerificationFlagsToMobileHome < ActiveRecord::Migration
  def self.up
    add_column    :mobile_homes, :address_verified, :boolean unless column_exists? :mobile_homes, :address_verified
    add_column    :mobile_homes, :owner_verified, :boolean unless column_exists? :mobile_homes, :owner_verified
  end

  def self.down
    remove_column :mobile_homes, :address_verified if column_exists? :mobile_homes, :address_verified
    remove_column :mobile_homes, :owner_verified if column_exists? :mobile_homes, :owner_verified
  end
end
