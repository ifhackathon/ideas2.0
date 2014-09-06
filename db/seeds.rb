# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'DESTROY ALL USERS'
User.destroy_all

puts 'CREATE ADMIN'
user = CreateAdminService.new.call
puts 'user: ' << user.email

puts 'CREATE USER'
user = CreateUserService.new.call
puts 'user: ' << user.email
