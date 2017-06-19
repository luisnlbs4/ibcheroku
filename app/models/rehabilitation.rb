class Rehabilitation < ActiveRecord::Base
  belongs_to :blind

  validate :verify_date

    def verify_date
	    unless (self.first_date < self.last_date)
	      errors.add(:first_date, "es mayor")
	    end
    end
end
