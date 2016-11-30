class AddLongitudeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :longitude, :float
  end
end
