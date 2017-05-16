class AddBlindToMedicals < ActiveRecord::Migration
  def change
    add_reference :medicals, :blind, index: true, foreign_key: true
  end
end
