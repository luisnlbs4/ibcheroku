class AddOthersToRehabilitation < ActiveRecord::Migration
  def change
  	add_column :rehabilitations, :type_rehab_others, :string
  end
end
