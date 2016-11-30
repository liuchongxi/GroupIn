class AlterRequests < ActiveRecord::Migration
  def up
  	add_column("ad_requests", "ad_name", :string, :limit => 25, :before => "first_name")
  end

  def down
  	remove_column("ad_requests", "ad_name")
  end	
end
