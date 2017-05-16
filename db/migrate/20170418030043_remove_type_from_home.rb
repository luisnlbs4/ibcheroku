class RemoveTypeFromHome < ActiveRecord::Migration
  def change
    remove_column :homes, :type, :string
    add_column :homes, :home_type, :string
  end
end
