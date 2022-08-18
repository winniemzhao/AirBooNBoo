require 'faker'
require 'open-uri'

puts "Destroying previous instances (comment this out if you want)"

Review.destroy_all
Spook.destroy_all
Ghost.destroy_all
User.destroy_all

# hardcoding
user_hard = User.new(
  name: "Mido",
  description: "Hard to scare practical joker",
  email: "midois@asmidodoes.com",
  password: "midois"
)
user_hard.photo.attach(io: File.open('app/assets/images/users/mido.jpg'), filename: 'mido.jpg', content_type: 'image/jpg')
user_hard.save!

user_other_hard = User.new(
  name: "Mike",
  description: "A trickster that has learned to monetize his dead family and friends",
  email: "wales@wales.wales",
  password: "superior"
)
user_other_hard.photo.attach(io: File.open('app/assets/images/users/mike.jpg'), filename: 'mike.jpg', content_type: 'image/jpg')
user_other_hard.save!

ghost_hard_else1 = Ghost.new(
  name: "Shades",
  spook_action: "Annoy",
  address: "5333 Av. Casgrain Suite 102, Montréal, QC H2T 1X3",
  description: "A cool ghost that will show you a good time, and then murder you in your sleep.",
  daily_rate: 139
)
ghost_hard_else1.user = user_other_hard
ghost_hard_else1.photo.attach(io: File.open('app/assets/images/ghosts/shades.jpg'), filename: 'shades.jpg', content_type: 'image/jpg')
ghost_hard_else1.save!

ghost_hard_else2 = Ghost.new(
  name: "Dog",
  spook_action: "Comfort",
  address: "3802 rue Gertrude, Montreal QC  H4G 1R5",
  description: "Aarf! Bark! Boo!",
  daily_rate: 50
)
ghost_hard_else2.user = user_other_hard
ghost_hard_else2.photo.attach(io: File.open('app/assets/images/ghosts/dog.jpg'), filename: 'dog.jpg', content_type: 'image/jpg')
ghost_hard_else2.save!

ghost_hard_else3 = Ghost.new(
  name: "Orbi",
  spook_action: "Scare",
  address: "Collège Saint-Barthélemy en Hors-Château, 31 4000 Liège",
  description: "Guaranteed to spook your lights out!",
  daily_rate: 100
)
ghost_hard_else3.user = user_other_hard
ghost_hard_else3.photo.attach(io: File.open('app/assets/images/ghosts/orbi.jpg'), filename: 'orbi.jpg', content_type: 'image/jpg')
ghost_hard_else3.save!

ghost_hard_else4 = Ghost.new(
  name: "Joker",
  spook_action: "Joke",
  address: "1170 Chambly Rd, Longueuil, Quebec J4J 1J9",
  description: "The Clown Prince of Spooks",
  daily_rate: 150
)
ghost_hard_else4.user = user_other_hard
ghost_hard_else4.photo.attach(io: File.open('app/assets/images/ghosts/Joker.jpg'), filename: 'Joker.jpg', content_type: 'image/jpg')
ghost_hard_else4.save!

ghost_hard_user1 = Ghost.new(
  name: "Wisp",
  spook_action: "Entertain",
  address: "360 Saint Francois Xavier St, Montreal, Quebec H2Y 2S8",
  description: "Wispy willows of sorrow and suffering",
  daily_rate: 200)
ghost_hard_user1.user = user_hard
ghost_hard_user1.photo.attach(io: File.open('app/assets/images/ghosts/wisp.jpg'), filename: 'wisp.jpg', content_type: 'image/jpg')
ghost_hard_user1.save!

ghost_hard_user2 = Ghost.new(
  name: "Skull",
  spook_action: "Protect",
  address: "Hell",
  description: "The freshest ghost on the market, bones still attached!",
  daily_rate: 250)
ghost_hard_user2.user = user_hard
ghost_hard_user2.photo.attach(io: File.open('app/assets/images/ghosts/skull.jpg'), filename: 'skull.jpg', content_type: 'image/jpg')
ghost_hard_user2.save!

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
    spook_action: %w[Annoy Comfort Scare Protect Entertain Joke].sample,
    address: Faker::Address.full_address,
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

puts "👻"
