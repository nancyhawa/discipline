class Referral < ActiveRecord::Base
  belongs_to :student
  belongs_to :staff_member
  has_many :infractions, through: :referral_infractions
end
