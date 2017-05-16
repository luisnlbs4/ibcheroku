class CreateBlinds < ActiveRecord::Migration
  def change
    create_table :blinds do |t|
    	t.string   :first_name
    	t.string   :second_name
    	t.string   :first_lastname
    	t.string   :second_lastname
    	t.string   :lastname_married
    	t.string   :civil_status
    	t.string   :address
    	t.string   :zone
    	t.string   :province
    	t.string   :department, default: "cochabamba"
    	t.string   :nationality
    	t.string   :language
    	t.boolean  :sex
    	t.date 	   :registration_date
    	t.date     :birthday
        t.string   :country_birth
        t.string   :city_birth
        t.string   :province_birth
        t.string   :ci
        t.integer  :cellphone
        t.string   :beneficiary_income
        t.string   :current_occupation
        t.string   :previous_occupation
        t.string   :degree_instruction
        t.string   :other_studies
        t.timestamps null: false
    end
  end
end
