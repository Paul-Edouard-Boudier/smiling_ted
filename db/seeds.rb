require 'faker'

Ted.destroy_all
User.destroy_all

user = User.create(
  email:"polo@hello.com" ,
  password:"password" ,
  password_confirmation: "password"
)

5.times do
  ted = Ted.create(name: Faker::Name.first_name, user_id: user.id)

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
