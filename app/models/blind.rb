class Blind < ActiveRecord::Base
	has_one :medical
	has_one :home
	has_many :rehabilitations
	has_many :familiars

	def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |blind|
      csv << blind.attributes.values_at(*column_names)
    end
  end
end
end
