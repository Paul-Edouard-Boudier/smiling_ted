require 'faker'
Photo.destroy_all
Chapter.destroy_all
Ted.destroy_all
User.destroy_all

puts "Creating 1 user..."

user = User.create!(

  email:"polo@hello.com" ,
  password:"password" ,
  password_confirmation: "password",
  first_name: "Polo",
  last_name: "Smith"
)
puts "User created : #{user.email} / #{user.password}\n"

number_of_travelers = 2
puts "Creating #{number_of_travelers} travelers..."

travelers = []
number_of_travelers.times do
 print "."
 travelers << User.create!(
   email: Faker::Internet.email,
   password: "password",
   password_confirmation: "password",
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
   avatar_url: [
     'https://cdn.kimkim.com/files/a/users/profile_photos/b455bdcef1d4f328b65291342e4bcc4057023e70/big.jpg',
     'https://s-media-cache-ak0.pinimg.com/736x/31/e9/0b/31e90b0ff5662cbe47d3f93fa4203603.jpg',
     'https://img2.10bestmedia.com/Images/Photos/322437/DSC-0103_56_600x600.jpg',
     'http://1.bp.blogspot.com/-Z7CrZb3vDmE/VXHhTeJUl5I/AAAAAAAADEA/lFTAJyNKP0o/s1600/Stars%2Bin%2Bthe%2BAlley.jpg'
     ].sample
 )
end

puts "\n"
puts "Creating a ted with some chapters..."

ted = Ted.create!(
 name: Faker::Name.first_name,
 user: user,
 rank: Faker::Number.between(1, 5),
 distance_traveled: Faker::Number.between(10, 3000),
 avatar_url: 'http://helpsimus.org/blog/wp-content/uploads/2010/11/peluche-et-enfant.jpg'
)
chapter = ted.chapters.create!(

  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'Paris',
  likes: 0,
  country: 'fr'

)
chapter.photos.create!(
 image_url: 'http://www.parisattitude.com/images/monuments.jpg',
 title: 'A great view from Paris',
 description: 'We were near the Eiffel Tower'
)
chapter.photos.create!(
 image_url: 'http://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/1444253482/DG2015-paris.jpg?itok=XH81cBH9',
 title: 'Such a beautiful city',
 description: 'This picture speaks on itself, this was such a lovely moment'
)
chapter.photos.create!(
 image_url: 'https://cdn.theculturetrip.com/wp-content/uploads/2015/11/Paris-%C2%A9-Ditty_about_summer-Shutterstock.jpg',
 title: 'Paris from top',
 description: 'The roofs of Paris'
)
chapter.photos.create!(
 image_url: 'http://cdn-image.travelandleisure.com/sites/default/files/styles/tnl_redesign_article_landing_page/public/1446842493/3-paris-social-niche1115.jpg?itok=wA-uNK8P',
 title: 'Arc de triomphe',
 description: 'So famous monument !'
)
chapter.photos.create!(
 image_url: 'http://cdn-image.travelandleisure.com/sites/default/files/styles/tnl_redesign_article_landing_page/public/1446842493/3-paris-social-niche1115.jpg?itok=wA-uNK8P',
 title: 'Magnifique Souvenir...',
 description: 'Bonjour, merci, vive Paris ! Your ted speak french !'
)

[2, 3, 4].sample.times do

  chapter = ted.chapters.create!(
    user: travelers.sample,
    description: Faker::HarryPotter.quote,
    # localisation: Faker::Address.city,
    country: Faker::Address.country_code,
    likes: 0
  )


 3.times do
   chapter.photos.create!(
     image_url: Faker::LoremPixel.image("200x200"),
     title: Faker::Hipster.sentence,
     description: Faker::Hipster.sentence
   )
 end
end

puts "\n"

number_of_teds = 2

puts "Creating #{number_of_teds} more teds..."

number_of_teds.times do
 ted = Ted.create!(
   name: Faker::Name.first_name,
   user: user,
   rank: Faker::Number.between(1, 5),
   location: ['New-York', 'Rome', 'Berlin', 'Saint-Etienne', 'Londres', 'Bankok'].sample,
   distance_traveled: Faker::Number.between(10, 3000),
   avatar_url: Faker::LoremPixel.image("100x100"),
 )
end
