class RemoveServicesOthersFromMedical < ActiveRecord::Migration
  def change
    remove_column :medicals, :services_others, :string
    add_column :homes, :services_others, :string
  end
end
