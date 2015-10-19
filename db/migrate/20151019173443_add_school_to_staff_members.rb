class AddSchoolToStaffMembers < ActiveRecord::Migration
  def change
    add_reference :staff_members, :school, index: true
    add_foreign_key :staff_members, :schools
  end
end
