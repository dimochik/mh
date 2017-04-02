class AddMakFieldsToMobilePark < ActiveRecord::Migration
  def self.up
    add_column    :mobile_homes, :m_full_address, :string unless column_exists? :mobile_homes, :m_full_address
    add_column    :mobile_homes, :mak_key, :string unless column_exists? :mobile_homes, :mak_key
    add_index     :mobile_homes, :mak_key unless index_exists? :mobile_homes, :mak_key
  end

  def self.down
    remove_column :mobile_homes, :m_full_address if column_exists? :mobile_homes, :m_full_address
    remove_column :mobile_homes, :mak_key if column_exists? :mobile_homes, :mak_key
    remove_index  :mobile_homes, :mak_key if index_exists? :mobile_homes, :mak_key
  end
end
