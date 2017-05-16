class CreateMedicals < ActiveRecord::Migration
  def change
    create_table :medicals do |t|
      t.string :type_blindness
      t.string :causes_blindness
      t.string :time_blindness
      t.string :general_diagnosis
      t.string :medical_attention_place
      t.string :additional_disability
      t.boolean :health_insurance?
      t.string :name_health_insurance
      t.timestamps null: false
    end
  end
end
