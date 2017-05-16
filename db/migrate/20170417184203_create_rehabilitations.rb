class CreateRehabilitations < ActiveRecord::Migration
  def change
    create_table :rehabilitations do |t|
      t.boolean :received?
      t.string :place
      t.date :first_date
      t.date :last_date
      t.string :type_rehab
      t.string :training_skils

      t.timestamps null: false
    end
  end
end
