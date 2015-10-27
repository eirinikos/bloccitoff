require 'faker'

# create users

3.times do
  User.create!(
    name: Faker::Name.name,
    email: "#{Faker::Team.creature}@gmail.com",
    password: "foobar",
    activated: true,
    activated_at: Time.zone.now
    )
end

user = User.first.update_attributes!(
  name: "Andrea",
  email: "andrealankao@gmail.com",
  password: "foobar")

users = User.all

# create items

36.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
    )
end

puts "C'est fini!"
puts "#{User.count} utilisateurs ont été crées!"
puts "#{Item.count} articles ont été crées!"