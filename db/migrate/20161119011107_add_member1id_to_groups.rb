class AddMember1idToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :member1id, :integer
  end
end
