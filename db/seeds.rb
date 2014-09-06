# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

puts 'DESTROY ALL USERS'
User.destroy_all

puts 'CREATE ADMIN'
user = CreateAdminService.new.call
puts 'user: ' << user.email

puts 'CREATE USER'
user = CreateUserService.new.call
puts 'user: ' << user.email


puts 'DESTROY ALL PRODUCT, ETC'
Project.destroy_all
ProjectFinanceCost.destroy_all
ProjectMaterial.destroy_all
ProjectPeopleTime.destroy_all


10.times do |i|

  puts 'CREATE Project Finance Cost'
  project = Project.create(name: Faker::Commerce.product_name,
                 description: Faker::Lorem.paragraph,
                 date_to: "25.#{i}.2014",
                 place: Faker::Address.city
  )

  puts 'CREATE Project Finance Cost'
  ProjectFinanceCost.create(name: Faker::Commerce.product_name, money: Faker::Commerce.price, project: project)
  ProjectFinanceCost.create(name: Faker::Commerce.product_name, money: Faker::Commerce.price, project: project)
  ProjectFinanceCost.create(name: Faker::Commerce.product_name, money: Faker::Commerce.price, project: project)

  puts 'CREATE Project Material'
  ProjectMaterial.create(name: Faker::Commerce.product_name, quantity: Faker::Number.number(2), measure: 'кг', project: project)
  ProjectMaterial.create(name: Faker::Commerce.product_name, quantity: Faker::Number.number(2), measure: 'кг', project: project)
  ProjectMaterial.create(name: Faker::Commerce.product_name, quantity: Faker::Number.number(2), measure: 'кг', project: project)

  puts 'CREATE Project People Time'
  ProjectPeopleTime.create(name: "Програміст Rails", day: Faker::Number.number(2), project: project)
  ProjectPeopleTime.create(name: "Прибиральниця ( senior)", day: Faker::Number.number(2), project: project)


end