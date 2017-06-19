class Blind < ActiveRecord::Base
	has_one :medical
	has_one :home
	has_many :rehabilitations
	has_many :familiars
  before_destroy :destroy_blind
	def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |blind|
        csv << blind.attributes.values_at(*column_names)
      end
    end
  end

  def destroy_blind
    id = self.id.to_i
    destroy_relations(id)
    destroy_original(id+1)
  end

  def destroy_relations(id)
      Home.where(blind_id: id).first.destroy     
      Medical.where(blind_id: id).first.destroy
      Rehabilitation.destroy_all(blind_id: id)
      Familiar.destroy_all(blind_id: id)
  end

  def destroy_original(id)
    destroy_relations(id)
  end

end
