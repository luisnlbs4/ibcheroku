class AddStatusToBlind < ActiveRecord::Migration
  def change
    add_column :blinds, :status, :string
  end
end
