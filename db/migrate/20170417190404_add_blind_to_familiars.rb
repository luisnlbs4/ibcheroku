class AddBlindToFamiliars < ActiveRecord::Migration
  def change
    add_reference :familiars, :blind, index: true, foreign_key: true
  end
end
