class ReferralInfraction < ActiveRecord::Base
  belongs_to :referral
  belongs_to :infraction
end
