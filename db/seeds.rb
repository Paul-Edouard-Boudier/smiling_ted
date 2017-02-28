require 'faker'

Ted.destroy_all
User.destroy_all


user = User.create(
  email:"polo@hello.com" ,
  password:"password" ,
  password_confirmation: "password"
)


5.times do

  autre = User.create(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar_url: 'http://lorempixel.com/50/50'
  )

  ted = Ted.create(
    name: Faker::Name.first_name,
    user_id: user.id,
    rank: Faker::Number.between(1, 5),
    distance_traveled: Faker::Number.between(10, 3000),
    code: Faker::Lorem.characters(6)
  )

  chapter = ted.chapters.create(
    user: user,
    description: Faker::HarryPotter.quote,
    localisation: 'Paris',
    likes: 0
  )

  3.times do
    chapter.photos.create(
      title: Faker::Name.title,
      description: Faker::HarryPotter.quote,
      image_url: 'http://lorempixel.com/200/200/'
    )
  end
end



