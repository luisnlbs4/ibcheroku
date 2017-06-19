class AddOthersColums < ActiveRecord::Migration
  def change
  	add_column :medicals, :services_others, :string
  	add_column :blinds, :beneficiary_income_others, :string
  	add_column :homes, :tenecia_others, :string
  	add_column :homes, :wall_type_others, :string
  	add_column :homes, :roof_type_others, :string
  	add_column :homes, :floor_type_others, :string
  end
end
