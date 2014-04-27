# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_or_create_by(email: "rocky@example.com"){|u| u.password = "12345678"; u.password_confirmation = "12345678"}

l1 = List.find_or_create_by(name: "l1"){|l| l.user = user}
l2 = List.find_or_create_by(name: "l2"){|l| l.user = user}

Todo.find_or_create_by(title: "t11"){|t| t.list = l1}
Todo.find_or_create_by(title: "t12"){|t| t.list = l1}
Todo.find_or_create_by(title: "t21"){|t| t.list = l2}
Todo.find_or_create_by(title: "t22"){|t| t.list = l2}
