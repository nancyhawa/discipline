class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.references :staff, index: true
      t.string :title

      t.timestamps null: false
    end
    add_foreign_key :rosters, :staffs
  end
end
