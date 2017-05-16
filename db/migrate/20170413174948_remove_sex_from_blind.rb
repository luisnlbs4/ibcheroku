class RemoveSexFromBlind < ActiveRecord::Migration
  def change
    remove_column :blinds, :sex, :boolean
    add_column :blinds, :sex, :string
  end
end
