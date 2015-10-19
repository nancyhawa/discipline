class AddUserClassToStaffMembers < ActiveRecord::Migration
  def change
    add_column :staff_members, :user_class, :string
  end
end
