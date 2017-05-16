class AddBlindToRehabilitations < ActiveRecord::Migration
  def change
    add_reference :rehabilitations, :blind, index: true, foreign_key: true
  end
end
