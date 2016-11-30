class CreateAdRequests < ActiveRecord::Migration
  def up
    create_table :ad_requests do |t|
    	t.string :first_name, :limit => 25
        t.string :last_name, :limit => 50
        t.string :phone_num, :limit => 12
        t.string :email, :default => '', :null => false
        t.text :request_detail, :limit => 500

        t.timestamps
    end
  end

  def down
  	drop_table :ad_requests
  end 
end
