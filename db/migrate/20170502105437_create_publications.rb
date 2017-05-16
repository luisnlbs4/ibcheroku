class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.date :initialDate
      t.date :finalDate
      t.boolean :showP

      t.timestamps null: false
    end
  end
end
