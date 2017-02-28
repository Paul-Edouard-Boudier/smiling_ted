require 'faker'

user = User.create(
  email:"polo@hello.com" ,
  password:"password" ,
  password_confirmation: "password"
)

10.times do
  Ted.create(name: Faker::Name.first_name, user_id: user.id)

end

urls = [
  'https://www.hillingdonstp.org/assets/_data/_council/_events/l/hcp1444039799.jpg',
  'http://teddybearpages.com/travel/amsterdam/amsterdam-canal.jpg'
]

photo = Photo.new
photo.save!
photo.photo_urls = urls
