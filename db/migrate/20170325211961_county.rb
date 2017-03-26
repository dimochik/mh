class County < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.string    :name
      t.integer   :metro_area_id
    end
  end
end
