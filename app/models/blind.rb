class Blind < ActiveRecord::Base
	has_one :medical
	has_one :home
	has_one :rehabilitation
	has_many :familiars
end
