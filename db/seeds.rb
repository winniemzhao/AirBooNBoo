require 'faker'
require 'open-uri'

puts "Destroying previous instances (comment this out if you want)"

Review.destroy_all
Spook.destroy_all
Ghost.destroy_all
User.destroy_all

# generate 20 users
# piggybacking on Mido's code here
(1..5).each do |num|
  file = URI.open("https://loremflickr.com/320/240/person")
  user = User.new(
      name: Faker::Name.name,
      description: Faker::Movies::Ghostbusters.quote,
      email: Faker::Internet.email,
      password: "password"
  )
  user.photo.attach(io: file, filename: "user#{num}.png", content_type: "image/jpg")
  user.save!
end

puts "Creating ghosts..."

(1..5).each do |num|
  file = URI.open("https://loremflickr.com/320/240/ghost")
  ghost = Ghost.new(
    name: Faker::Movies::Ghostbusters.character,
    spook_action: %w[interactive ectoplasm poltergeist orb funnel].sample,
    location: %w[Manchester Paris Toronto].sample,
    description: Faker::Lorem.paragraph,
    daily_rate: Faker::Number.decimal(l_digits: 2)
  )
  ghost.photo.attach(io: file, filename: "ghost#{num}.png", content_type: "image/jpg")
  ghost.user = [User.first, User.last].sample
  ghost.save!
end

puts "Creating spooky spooks..."

5.times do
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

puts "👻👻👻"
