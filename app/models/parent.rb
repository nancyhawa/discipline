class Parent < ActiveRecord::Base
  has_many :student_parents
  has_many :students, through: :student_parents
end
