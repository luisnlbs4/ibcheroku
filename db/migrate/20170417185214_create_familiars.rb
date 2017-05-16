class CreateFamiliars < ActiveRecord::Migration
  def change
    create_table :familiars do |t|
      t.string :relationship
      t.string :names
      t.string :first_lastname
      t.string :second_lastname
      t.string :degree_instruction
      t.string :occupation
      t.string :disability
      t.date :birthday
      t.string :observation

      t.timestamps null: false
    end
  end
end
