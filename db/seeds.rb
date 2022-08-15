require 'faker'

# generate 20 users
(1..10).each do
  User.create!(
      name: Faker::Name.name,
      description: Faker::Movies::Ghostbusters.quote,
      email: Faker::Internet.email,
      password: "password"
  )
end
