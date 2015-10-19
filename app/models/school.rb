class School < ActiveRecord::Base
  has_many :students
  has_many :staff_members
end
