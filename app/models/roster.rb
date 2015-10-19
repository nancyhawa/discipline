class Roster < ActiveRecord::Base
  belongs_to :staff
  has_many :students, through: :roster_students
end
