class AddMember4idToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :member4id, :integer
  end
end
