class Student < ActiveRecord::Base
  belongs_to :school
  has_many :referrals
  has_many :student_rosters
  has_many :rosters, through: :student_rosters
  has_many :student_parents
  has_many :parents, through: :student_parents
  has_many :staff_members, through: :rosters

  def full_name
    "#{first_name} #{last_name.capitalize}"
  end
end
