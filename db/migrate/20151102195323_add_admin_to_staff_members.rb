class AddAdminToStaffMembers < ActiveRecord::Migration
  def change
    add_column :staff_members, :admin, :boolean
  end
end
