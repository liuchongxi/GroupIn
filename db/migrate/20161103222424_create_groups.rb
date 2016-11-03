class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.timestamp :time
      t.string :activity_type
      t.string :location
      t.string :group_owner
      t.string :member1
      t.string :member2
      t.string :member3
      t.string :member4
      t.string :description

      t.timestamps null: false
    end
  end
end
