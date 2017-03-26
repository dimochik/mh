class MetroArea < ActiveRecord::Migration
  def change
    create_table :metro_areas do |t|
      t.string    :name
      t.integer   :state_id
    end
  end
end
