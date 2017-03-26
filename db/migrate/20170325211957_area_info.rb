class AreaInfo < ActiveRecord::Migration
  def change
    create_table :area_stats do |t|
      t.integer   :informable_id
      t.string    :informable_type
      t.string    :name
      t.integer   :population
      t.integer   :median_home_price
      t.integer   :household_income
      t.decimal   :house_vacancy
      t.decimal   :unemployment
      t.decimal   :future_job_growth
      t.string    :link
    end
  end
end
