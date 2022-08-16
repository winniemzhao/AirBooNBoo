require 'faker'

puts "Destroying previous instances (comment this out if you want)"

Review.destroy_all
Spook.destroy_all
Ghost.destroy_all
User.destroy_all

# note that this needs to be entirely rewritten to promote random users and ghosts
# this is only for testing on Tuesday

# generate 20 users
(1..10).each do
  User.create!(
      name: Faker::Name.name,
      description: Faker::Movies::Ghostbusters.quote,
      email: Faker::Internet.email,
      password: "password"
  )
end

puts "Creating ghosts..."

10.times do
  ghost = Ghost.new(
    name: Faker::Movies::Ghostbusters.character,
    spook_action: %w[interactive ectoplasm poltergeist orb funnel].sample,
    location: %w[Manchester Paris Toronto],
    description: Faker::Lorem.paragraph,
    daily_rate: Faker::Number.decimal(l_digits: 2)
  )
  ghost.user = [User.first, User.last].sample
  ghost.save!
end

puts "Creating spooky spooks..."

10.times do
  spook = Spook.new(
    start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    end_date: Faker::Date.between(from: '2014-10-01', to: '2014-10-03'),
    status: rand(0..2)
  )
  spook.ghost = [Ghost.first, Ghost.last].sample
  spook.user = spook.ghost.user == User.first ? User.last : User.first
  spook.save!
end

puts "Creating one or two reviews..."

rand(1..2).times do
  review = Review.new(
    rating: rand(1..10),
    comment: Faker::Lorem.sentence,
  )
  review.spook = [Spook.first, Spook.last].sample
  review.save!
end

puts "👻"

