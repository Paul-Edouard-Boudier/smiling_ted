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
    avatar_url: 'https://img0.etsystatic.com/026/1/7709457/il_340x270.630724042_jfxs.jpg'
  )

  ted = Ted.create!(
    name: Faker::Name.first_name,
    user_id: autre.id,
    rank: Faker::Number.between(1, 5),
    distance_traveled: Faker::Number.between(10, 3000),
    code: "739541FR",
    avatar_url: 'https://upload.wikimedia.org/wikipedia/en/d/d5/Pedobear.png'

  )

  chapter = ted.chapters.create(
    user: autre,
    description: Faker::HarryPotter.quote,
    localisation: 'Paris',
    likes: 0
  )

  3.times do
    chapter.photos.create(
      title: Faker::Name.title,
      description: Faker::HarryPotter.quote,
      image_url: 'https://s-media-cache-ak0.pinimg.com/736x/fe/92/c0/fe92c04bd02a5f740a7611c6379b2878.jpg'
    )
  end
end



