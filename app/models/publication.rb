class Publication < ActiveRecord::Base

validates :image_path, :presence => {:message => "usted debe ingresar una url de imagen" }
validates :title, :presence => {:message => "Usted debe ingresar un titulo"},:uniqueness => {:message => "Usted ha ingresado un titlulo repetido"}
validates :finalDate, :presence =>{:message => "Tiene que ingresar fecha final"}
end
