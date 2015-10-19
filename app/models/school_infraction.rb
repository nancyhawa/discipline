class SchoolInfraction < ActiveRecord::Base
  belongs_to :school
  belongs_to :infraction
end
