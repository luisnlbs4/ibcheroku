class AddBlindToHomes < ActiveRecord::Migration
  def change
    add_reference :homes, :blind, index: true, foreign_key: true
  end
end
