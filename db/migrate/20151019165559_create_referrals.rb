class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.references :student, index: true
      t.references :staff_member, index: true
      t.boolean :positive?
      t.string :type
      t.text :anecdotal
      t.text :additional_information
      t.integer :points
      t.date :date
      t.boolean :deans_referral?
      t.string :period
      t.string :integer
      t.string :location

      t.timestamps null: false
    end
    add_foreign_key :referrals, :students
    add_foreign_key :referrals, :staff_members
  end
end
