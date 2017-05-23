# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	user = User.new
	user.email = "ibc@gmail.com"
	user.password = "123456"
	user.password_confirmation = "123456"
	user.name = "Pepito"	
	user.lastname = "Sanchez"
	user.save
	user.add_role :Administrador


