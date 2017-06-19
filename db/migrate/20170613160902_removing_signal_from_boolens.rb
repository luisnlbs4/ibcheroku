class RemovingSignalFromBoolens < ActiveRecord::Migration
  def change
  	rename_column :medicals, :health_insurance?, :health_insurance
  	rename_column :homes, :bathroom?, :bathroom
  	rename_column :homes, :kitchen?, :kitchen
  	rename_column :rehabilitations, :received?, :recived
  end
end
