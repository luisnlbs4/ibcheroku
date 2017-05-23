class AddCellphoneToFamiliar < ActiveRecord::Migration
  def change
    add_column :familiars, :cellphone, :integer
  end
end
