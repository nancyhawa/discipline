class ReferralsController < ApplicationController
  def index
    @referrals = Referral.all
  end

  def show
  end

  def new
    @referral = Referral.new
    @students = current_staff_member.school.students.all
  end

  def create
    Referral.build_from_form_input(params, referral_params)
    redirect_to new_referral_path
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  def search_students

  end

  def filter_students
    if Roster.exists?(params[:roster_id])
      @students = Roster.find(params[:roster_id]).students
    else
      @students = current_staff_member.school.students
    end

    respond_to do |format|
      format.html { render partial: 'student_checklist'}
      format.js { render partial: 'student_checklist'}
      format.json { render partial: 'student_checklist'}
    end
  end

  private
  def referral_params
    params.require(:referral).permit(:student_id, :date, :anecdotal, :additional_information, :deans_referral?, :positive?, :location, :period, :referral_type, :students, :staff_member_id, :infractions, :minutes)
  end

end
