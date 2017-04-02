class RenameCountyOnAddress < ActiveRecord::Migration
  def change
    rename_column :addresses, :county, :county_name
  end
end
