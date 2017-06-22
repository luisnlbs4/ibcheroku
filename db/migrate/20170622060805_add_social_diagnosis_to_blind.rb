class AddSocialDiagnosisToBlind < ActiveRecord::Migration
  def change
    add_column :blinds, :social_diagnosis, :text
  end
end
