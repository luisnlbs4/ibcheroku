class AddOriginalToBlind < ActiveRecord::Migration
  def change
    add_column :blinds, :original, :boolean, default: false
  end
end
