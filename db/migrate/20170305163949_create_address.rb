class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer   :addressable_id
      t.string    :addressable_type
      t.string    :county
      t.string    :city
      t.string    :state
      t.string    :number
      t.string    :street
      t.string    :street_type
      t.string    :zip
      t.string    :full_address
    end
  end
end
