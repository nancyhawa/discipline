class CreateReferralInfractions < ActiveRecord::Migration
  def change
    create_table :referral_infractions do |t|
      t.references :referral, index: true
      t.references :infraction, index: true

      t.timestamps null: false
    end
    add_foreign_key :referral_infractions, :referrals
    add_foreign_key :referral_infractions, :infractions
  end
end
