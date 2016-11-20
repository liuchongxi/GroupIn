class AddMember3idToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :member3id, :integer
  end
end
