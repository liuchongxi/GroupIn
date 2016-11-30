class AddLatitudeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :latitude, :float
  end
end
