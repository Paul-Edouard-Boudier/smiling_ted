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
    avatar_url: 'http://tlc.lk/themes/TLC-front/front_theme/img/default_avatar_medium.png'
  )

  ted = Ted.create!(
    name: Faker::Name.first_name,
    user_id: autre.id,
    rank: Faker::Number.between(1, 5),
    distance_traveled: Faker::Number.between(10, 3000),
    code: "739541FR",
    avatar_url: 'http://n3.sdlcdn.com/imgs/a/m/1/Dhoom-Soft-Toys-Teddy-Bear-SDL465999567-1-80a9e.jpg'

  )

  chapter = ted.chapters.create(
    user: autre,
    description: Faker::HarryPotter.quote,
    localisation: Faker::Address.country,
    likes: 0
  )

  3.times do

    teddys_url =[
    "http://ic.pics.livejournal.com/untxi/49393179/16651/16651_original.jpg",
    "http://s11.postimg.org/fcasodrer/prague_bear_1_490.jpg",
    "http://teddybearpages.com/travel/images/teddylove.jpg",
    "http://img2.gorod.lv/images/news_item_in_cifs/pic/203748/big/15.jpg?v=1471354555",
    "http://image.nanopress.it/viaggi/fotogallery/1200X0/99231/peluche-alle-prese-col-ramen.jpg"
    ]

    photos_titles =[
      Faker::HarryPotter.book,
      Faker::Hipster.sentence,
      Faker::Lorem.words(4).join(" ")
    ]
    chapter.photos.create(
      title: photos_titles.sample,
      image_url: teddys_url.sample
    )
  end
end



