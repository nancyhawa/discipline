require 'rails_helper'

RSpec.describe Referral, type: :model do

  describe '#build_from_form_input' do
    context "given params from a disciplinary referral form" do
    it "builds a valid referral" do
      @params = {
         "utf8"=>"✓",
         "authenticity_token"=>
          "4EptzLV2uqbXlrZ8A26DxOQURwJbgLyaQs02RcxQC6v3zAFhI+p5kh9Ze5gLuixZtHv8LTKZEI5PTSEnnVkISw==",
         "referral"=>
          {"date"=>["2015-11-26"],
           "student_id"=>["1"],
           "period"=>"4",
           "positive?"=>"false",
           "referral_type"=>"discipline",
           "staff_member_id"=>"1",
           "location"=>"Auditorium",
           "infractions"=>["Vandalism", "Profanity", "Insubordination"],
           "anecdotal"=>"Aliena wrote a several curses on a classroom desk after being asked not to.",
           "additional_information"=>""},
         "commit"=>"Submit",
         "controller"=>"referrals",
         "action"=>"create"}
      @referral_params = {
         "anecdotal"=>"Aliena wrote a several curses on a classroom desk after being asked not to.",
         "additional_information"=>"",
         "positive?"=>"false",
         "location"=>"Auditorium",
         "period"=>"4",
         "referral_type"=>"discipline",
         "staff_member_id"=>"1"}


         #How to test when rspec doesn't handle paras the same way rails controller does.
        referral = Referral.build_from_form_input(@params, @referral_params)
        expect(referral.anecdotal).to be_falsey
        expect(referral.location).to eql("Auditorium")
        expect(referral.period).to eql(4)
        expect(referral.referral_type).to eql("discipline")
        expect(ReferralInfraction.where(referral_id: referral.id).length).to eql(3)
        expect(ReferralInfraction.where(referral_id: referral.id)).to include("Profanity")
      end
    end
  end
end
