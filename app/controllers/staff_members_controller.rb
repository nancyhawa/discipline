class StaffMembersController < ApplicationController

  def new

  end

  def show
    @staff_member = current_staff_member
  end
end
