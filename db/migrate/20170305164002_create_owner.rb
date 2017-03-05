class CreateOwner < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string    :name
      t.string    :mail_name
    end
  end
end
