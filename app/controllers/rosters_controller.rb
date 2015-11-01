class RostersController < ApplicationController
  def index

  end

  def show
    @roster = Roster.find(params[:id])
  end

  def new
    @roster = Roster.create(staff_member_id: current_staff_member.id)
    redirect_to edit_roster_path(@roster.id)
  end

  def create
  end

  def edit
    @roster = Roster.find(params[:id])
  end

  def update
    # binding.pry
    @roster = Roster.find(params[:id])
    @roster.update_students(params[:roster_ids])

    respond_to do |format|
      format.html { j render partial: 'sortform'}
    end
  end

  def delete
  end

  def destroy
  end

  def title
    # binding.pry
    @roster = Roster.find(params[:id])
    @roster.title = params[:title]
    @roster.save

    respond_to do |format|
      format.json {render json: @roster}
    end
  end
end
