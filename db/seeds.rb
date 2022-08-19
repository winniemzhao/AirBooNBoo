require 'faker'
require 'open-uri'

puts "Destroying previous instances"

Spook.destroy_all
Ghost.destroy_all
User.destroy_all

# hardcoding
michelangelo = User.new(
  name: "Michelangelo",
  description: "I love ghosts and other phantomly stuff",
  email: "ghost@ghost.ghost",
  password: "ghosts"
)
michelangelo.photo.attach(io: File.open('app/assets/images/users/mike.jpg'), filename: 'mike.jpg', content_type: 'image/jpg')
michelangelo.save!

winifred = User.new(
  name: "Winifred",
  description: "I'm haunting you in your dreams",
  email: "a@a.a",
  password: "aaaaaa"
)
winifred.photo.attach(io: File.open('app/assets/images/users/winnie.jpg'), filename: 'winnie.jpg', content_type: 'image/jpg')
winifred.save!

shades = Ghost.new(
  name: "Shades",
  spook_action: "Annoy",
  address: "5333 Av Casgrain, Montreal, Quebec, Canada",
  description: "A cool ghost that will show you a good time, and then murder you in your sleep.",
  daily_rate: 139
)
shades.user = winifred
shades.photo.attach(io: File.open('app/assets/images/ghosts/shades.jpg'), filename: 'shades.jpg', content_type: 'image/jpg')
shades.save!

dog = Ghost.new(
  name: "Dog",
  spook_action: "Comfort",
  address: "3802 rue Gertrude, Verdun, Quebec, Canada",
  description: "Aarf! Bark! Boo!",
  daily_rate: 50
)
dog.user = winifred
dog.photo.attach(io: File.open('app/assets/images/ghosts/dog.jpg'), filename: 'dog.jpg', content_type: 'image/jpg')
dog.save!

ghost_stephane = Ghost.new(
  name: "Ghost Stephane",
  spook_action: "Scare",
  address: "5444 Casgrain, Montreal, Quebec, Canada",
  description: "Will infiltrate your dreams and speak only in Ruby. Complete your flashcards or else…",
  daily_rate: 100
)
ghost_stephane.user = winifred
ghost_stephane.photo.attach(io: File.open('app/assets/images/ghosts/ghost_stephane.jpeg'), filename: 'ghost_stephane.jpeg', content_type: 'image/jpeg')
ghost_stephane.save!

kieran = Ghost.new(
  name: "Kieran",
  spook_action: "Joke",
  address: "7070 Henri-Julien, Montreal, Quebec, Canada",
  description: "The Clown Prince of Spooks",
  daily_rate: 150
)
kieran.user = winifred
kieran.photo.attach(io: File.open('app/assets/images/ghosts/kieran.gif'), filename: 'kieran.gif', content_type: 'image/gif')
kieran.save!

wisp = Ghost.new(
  name: "Wisp",
  spook_action: "Entertain",
  address: "4000 Casgrain, Montreal, Quebec, Canada",
  description: "Wispy willows of sorrow and suffering",
  daily_rate: 200)
wisp.user = winifred
wisp.photo.attach(io: File.open('app/assets/images/ghosts/wisp.jpg'), filename: 'wisp.jpg', content_type: 'image/jpg')
wisp.save!

skull = Ghost.new(
  name: "Skull",
  spook_action: "Protect",
  address: "6000 Casgrain, Montreal, Quebec, Canada",
  description: "The freshest ghost on the market, bones still attached!",
  daily_rate: 250)
skull.user = winifred
skull.photo.attach(io: File.open('app/assets/images/ghosts/skull.jpg'), filename: 'skull.jpg', content_type: 'image/jpg')
skull.save!

puts "👻👻👻"
