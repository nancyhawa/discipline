class AddProfessionalNameToStaffMembers < ActiveRecord::Migration
  def change
    add_column :staff_members, :professional_name, :string
  end
end
