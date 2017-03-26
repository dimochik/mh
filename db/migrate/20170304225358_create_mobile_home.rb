class CreateMobileHome < ActiveRecord::Migration
  def change
    create_table :mobile_homes do |t|
      t.integer   :owner_id
      t.string    :park_name
      t.integer   :number_of_lots
      t.integer   :occupied_lots
      t.integer   :occupancy_percent
      t.string    :mhbay_url
      t.integer   :mhbay_id
      t.string    :park_web_site_url
      t.string    :poh
      t.decimal   :lot_rent
      t.string    :water
      t.string    :sewer
      t.string    :trash
      t.boolean   :fifty_five_plus
      t.text      :description
      t.string    :parcel_id
      t.string    :county_id
      t.integer   :rausa_id
      t.string    :state
      t.datetime  :trans_date
      t.decimal   :sale_price
      t.decimal   :mkt_val_land
      t.decimal   :mkt_val_bldg
      t.decimal   :mkt_val_tot
      t.integer   :bldg_sqft
      t.string    :ngh_code
      t.string    :land_use_code
      t.string    :land_use_class
      t.string    :story_height
      t.string    :muni_id
      t.string    :school_dist_id
      t.decimal   :acreage_deeded
      t.decimal   :acreage_calc
      t.text      :geom_as_wkt
    end
  end
end
