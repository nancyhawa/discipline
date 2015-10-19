class AddNameToStaffMembers < ActiveRecord::Migration
  def change
    add_column :staff_members, :first_name, :string
    add_column :staff_members, :last_name, :string
  end
end
