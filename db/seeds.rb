# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
m = User.create(first_name: 'test', last_name: 'blog', email: 'test@email.com', password: 'test1', password_confirmation: 'test1', role: 'editor')