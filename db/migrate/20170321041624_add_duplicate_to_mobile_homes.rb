class AddDuplicateToMobileHomes < ActiveRecord::Migration
  def self.up
    add_column    :mobile_homes, :duplicate, :boolean unless column_exists? :mobile_homes, :duplicate
  end

  def self.down
    remove_column :mobile_homes, :duplicate if column_exists? :mobile_homes, :duplicate
  end
end
