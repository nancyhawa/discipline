class Referral < ActiveRecord::Base
  belongs_to :student
  belongs_to :staff_member
  has_many :infractions, through: :referral_infractions

  validates :student_id, presence: true
  validates :staff_member_id, presence: true

  def self.build_from_form_input(params, referral_params)
    @@params = params
    @@referral_params = referral_params
    type = @@params[:referral][:referral_type]

    build_discipline if type == "discipline"
    build_uniform if type == "uniform"
    build_tardy if type == "tardy"
    build_positive if type == "acclaim"
  end

  def self.build_positive
    referral = Referral.create(@@referral_params)
    referral.date = @@params["referral"][:date][0].to_date || DateTime.now.to_date
    referral.update_attribute(:student_id, @@params[:referral][:student_id][0].to_i)
    referral.save
  end

  def self.build_discipline
    referral = Referral.create(@@referral_params)
    @@params[:referral][:infractions].each do | input |
      ReferralInfraction.create(referral_id: referral.id, infraction_id: Infraction.find_by(name: input).id)
    end
    referral.update_attribute(:student_id, @@params[:referral][:student_id][0].to_i)
    referral.date = @@params["referral"][:date][0].to_date || DateTime.now.to_date
    referral.save
  end

  def self.build_uniform
    @@params[:referral][:students].each do |student_id|
      referral = Referral.create(@@referral_params)
      referral.student_id = student_id.to_i
      referral.date = @@params["referral"][:date][0].to_date || DateTime.now.to_date
      referral.update_attribute(:anecdotal, "Student was out of uniform.")
      referral.save
    end
  end

  def self.build_tardy
    @@params[:referral][:students].each do |student_id|
      referral = Referral.create(@@referral_params)
      referral.student_id = student_id.to_i
      referral.date = @@params["referral"][:date][0].to_date || DateTime.now.to_date
      if !!(@@params[:minutes])
        referral.update_attribute(:anecdotal, "Student was #{@@params[:minutes]} minutes late to class.")
      else
        referral.update_attribute(:anecdotal, "Student was late to class.")
      end
      referral.save
    end
  end

end
