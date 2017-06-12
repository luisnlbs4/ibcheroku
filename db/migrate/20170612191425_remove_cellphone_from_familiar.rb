class RemoveCellphoneFromFamiliar < ActiveRecord::Migration
  def change
    remove_column :familiars, :cellphone, :integer
    add_column :familiars, :cellphone, :string
  end
end
