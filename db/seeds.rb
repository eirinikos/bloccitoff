# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@todo1 = Todo.create!(description: "buy a milkshake")
@todo2 = Todo.create!(description: "drink a milkshake")
@todo3 = Todo.create!(description: "recycle the cup")