class Publication < ActiveRecord::Base


validates :title, :presence => {:message => "Usted debe ingresar un titulo"},:uniqueness => {:message => "Usted ha ingresado un titlulo repetido"}
end
