# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!({email: "jane@example.com", password: "12345678", password_confirmation: "12345678"})
l1 = List.create!({name: "l1", user: user})
l2 = List.create!({name: "l2", user: user})