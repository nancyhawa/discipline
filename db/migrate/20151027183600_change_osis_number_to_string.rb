class ChangeOsisNumberToString < ActiveRecord::Migration
  def change
    change_column :students, :osis_number,  :string
  end
end
