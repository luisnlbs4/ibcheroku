class AddAccessOthersToRehabilitation < ActiveRecord::Migration
  def change
    add_column :homes, :accessibility_others, :string
  end
end
