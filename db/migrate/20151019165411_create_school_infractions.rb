class CreateSchoolInfractions < ActiveRecord::Migration
  def change
    create_table :school_infractions do |t|
      t.references :school, index: true
      t.references :infraction, index: true

      t.timestamps null: false
    end
    add_foreign_key :school_infractions, :schools
    add_foreign_key :school_infractions, :infractions
  end
end
