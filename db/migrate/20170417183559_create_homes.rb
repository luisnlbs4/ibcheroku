class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :zone
      t.string :type
      t.string :services
      t.string :tenecia
      t.string :accessibility
      t.integer :rooms
      t.boolean :bathroom?
      t.boolean :kitchen?
      t.string :wall_type
      t.string :roof_type
      t.string :floor_type

      t.timestamps null: false
    end
  end
end
