# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_or_create_by_email({email: "jane@example.com", password: "12345678", password_confirmation: "12345678"})
l1 = List.find_or_create_by_name({name: "l1", user: user})
l2 = List.find_or_create_by_name({name: "l2", user: user})
t1 = Todo.find_or_create_by_title({title: "t11", list: l1})
t2 = Todo.find_or_create_by_title({title: "t12", list: l1})
t1 = Todo.find_or_create_by_title({title: "t21", list: l2})
t2 = Todo.find_or_create_by_title({title: "t22", list: l2})