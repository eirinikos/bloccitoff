require 'faker'

# create users

8.times do
  User.create!(
    name: Faker::Lorem.name,
    email: Faker::Internet.email
    )
end

users = User.all

# create items

48.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
    )
end

puts "C'est fini!"
puts "#{User.count} utilisateurs ont été crées!"
puts "#{Item.count} articles ont été crées!"