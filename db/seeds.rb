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





puts "Creating 8 travelers..."


traveler1 = User.create!(
  email:"jessy@hello.com" ,
  password:"password" ,
  password_confirmation: "password",
  first_name: "Jessy",
   last_name: Faker::Name.last_name,
   avatar_url: 'http://bornglobals.com/wp-content/uploads/2016/06/profil-square.jpg',
)

traveler2 = User.create!(
  email:"leora@hello.com" ,
  password:"password" ,
  password_confirmation: "password",
  first_name: "Leora",
   last_name: Faker::Name.last_name,
   avatar_url: 'https://corporate.moviestarplanet.com/wp-content/uploads/2014/02/NicolineGraversen_profil_square.png',
)

traveler3 = User.create!(
  email:"jennyfer@hello.com",
  password:"password" ,
  password_confirmation: "password",
  first_name: "Jennyfer",
   last_name: Faker::Name.last_name,
   avatar_url: 'https://a0.muscache.com/im/pictures/a7cc1502-baab-4a2b-9de7-04ec2fac73b2.jpg?aki_policy=profile_x_medium',
)

traveler4 = User.create!(
  email:"frank@hello.com" ,
  password:"password" ,
  password_confirmation: "password",
  first_name: "Frank",
   last_name: Faker::Name.last_name,
   avatar_url: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQJYCZpNdHr9XDeBXio3TTG6L15yF7koaPvFRnqWP_OuHIgri0W',
)

traveler5 = User.create!(
  email:"corbin@hello.com",
  password:"password" ,
  password_confirmation: "password",
  first_name: "Corbin",
   last_name: Faker::Name.last_name,
   avatar_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfUDVHCl9e6ymufXlLUc_Br8etAKDpCMZ22PfingvtqJaeYWEa',
)

traveler6 = User.create!(
  email:"doyle@hello.com" ,
  password:"password" ,
  password_confirmation: "password",
  first_name: "Doyle",
   last_name: Faker::Name.last_name,
   avatar_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQM_JmGUbr8X-azKPEpi_EpbQ8L-rd3NWt4CdKz1HILJHzn9ON',
)

traveler7 = User.create!(
  email:"augustina@hello.com" ,
  password:"password" ,
  password_confirmation: "password",
  first_name: "Augustina",
   last_name: Faker::Name.last_name,
   avatar_url: 'http://d38we5ntdyxyje.cloudfront.net/270979/profile/avatar_medium_square.jpg',
)

traveler8 = User.create!(
  email:"brice@hello.com" ,
  password:"password" ,
  password_confirmation: "password",
  first_name: "Brice",
   last_name: Faker::Name.last_name,
   avatar_url: 'https://lh3.googleusercontent.com/-5-yxbI8MtNQ/VcBeFN3gyUI/AAAAAAAAB2Q/5zrvofKXWkw/w1171-h1171/Profile%2B-%2B2015-7-14%2BSquare%2B50.jpg',
)

travelers = [traveler1, traveler2, traveler3, traveler4, traveler5, traveler6, traveler7, traveler8 ]



# *************** TEDDYS THAT ARE NOT ON THE HOME PAGE DONT HAVE ANY PHOTOS *****************

5.times do

a_ted = Ted.create!(
 name: Faker::Name.first_name,
 user: travelers.sample,
 rank: Faker::Number.between(1, 5),
 distance_traveled: Faker::Number.between(10, 3000)
)

a_first_chapter = a_ted.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: ['Pekin', 'Venise', 'République Tchèque', 'Argentine', 'Costa Rica', 'Dakar', 'Cape Vert', 'Guadeloupe', 'Vancouver'].sample,
  likes: 0,
  country: 'fr'
)

a_second_chapter = a_ted.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: ['Pekin', 'Venise', 'République Tchèque', 'Argentine', 'Costa Rica', 'Dakar', 'Cape Vert', 'Guadeloupe', 'Vancouver'].sample,
  likes: 0,
  country: 'fr'
)

end

# *************** TEDDYS THAT ARE ON THE HOME PAGE : *****************
puts "\n"
puts "Creating a white bear with some chapters..."

white_bear = Ted.create!(
 name: 'Einstein',
 user: traveler1,
 rank: Faker::Number.between(1, 5),
 distance_traveled: Faker::Number.between(10, 3000),
 avatar_url: 'https://www.dhresource.com/600x600/f2/albu/g1/M00/24/0B/rBVaGFZwTSSABsWuAAMS9b_8Hdk555.jpg',
 created_at: DateTime.parse("09/12/2016 17:00")
)

white_bear_chapter1 = white_bear.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'Lyon',
  likes: 0,
  country: 'fr'
)

white_bear_chapter2 = white_bear.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'Vienne',
  likes: 0,
  country: 'at'
)

white_bear_chapter2.photos.create!(
 image_url: 'http://4.bp.blogspot.com/-5cRGwMc-PuU/UDZWlRcfzmI/AAAAAAAACsU/alO6-n8b1HQ/s1600/DSC02582.jpg',
 title: 'Window on Vienne',
 description: 'Kisses from Europe !'
)




puts "\n"
puts "Creating a panda with some chapters..."

panda = Ted.create!(
 name: 'Nia',
 user: traveler2,
 rank: Faker::Number.between(1, 5),
 distance_traveled: Faker::Number.between(10, 3000),
 avatar_url: 'http://peluchepanda.fr/324-thickbox_default/panda-teddy.jpg',
 created_at: DateTime.parse("21/07/2016 17:00")
)

panda_chapter1 = panda.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'Paris',
  likes: 0,
  country: 'fr'
)

panda_chapter2 = panda.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'Tokyo',
  likes: 0,
  country: 'jp'
)

panda_chapter2.photos.create!(
 image_url: 'https://i.ytimg.com/vi/scwa52oTZDc/maxresdefault.jpg',
 title: 'On the road for Tokyo',
 description: 'Adventuuuuuuuure'
)



puts "\n"
puts "Creating a koala with some chapters..."

koala = Ted.create!(
 name: 'Isobel',
 user: traveler3,
 rank: Faker::Number.between(1, 5),
 distance_traveled: Faker::Number.between(10, 3000),
 avatar_url: 'https://images-na.ssl-images-amazon.com/images/I/41slR9tEN4L._SY355_.jpg',
 created_at: DateTime.parse("07/01/2017 17:00")
)

koala_chapter0 = koala.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'Bruxelles',
  likes: 0,
  country: 'be'
)

koala_chapter1 = koala.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'Vietnam',
  likes: 0,
  country: 'vn'
)

koala_chapter1.photos.create!(
 image_url: 'https://scontent-amt2-1.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/16123157_1954638774819836_6868896726401417216_n.jpg',
 title: 'Forest is scary',
 description: 'it was almost night'
)




puts "\n"
puts "Creating a monkey with ONE CHAPTER (travel just began)..."

monkey = Ted.create!(
 name: 'Trevor',
 user: traveler4,
 rank: Faker::Number.between(1, 5),
 distance_traveled: Faker::Number.between(10, 3000),
 avatar_url: 'http://media.jojomamanbebe.com/media/catalog/product/cache/2/image/1000x/cc44d3b39965d3efd15a8158cb2fdfb4/D/4/D4286.jpg'
)

monkey_chapter1 = monkey.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'Paris',
  likes: 0,
  country: 'fr'
)

monkey_chapter1.photos.create!(
 image_url: 'http://68.media.tumblr.com/689da107ea574fd9c6f26318aea1bab9/tumblr_inline_of9g72RHaI1qahamr_1280.jpg',
 title: 'A great view from Paris',
 description: 'We were near the Eiffel Tower'
)


puts "\n"
puts "Creating a dark brown teddy with some chapters..."

dark_brown = Ted.create!(
 name: 'Walter',
 user: traveler4,
 rank: Faker::Number.between(1, 5),
 distance_traveled: Faker::Number.between(10, 3000),
 avatar_url: 'http://media.jojomamanbebe.com/media/catalog/product/cache/2/image/1000x/cc44d3b39965d3efd15a8158cb2fdfb4/D/4/D4286.jpg',
 created_at: DateTime.parse("25/12/2016 17:00")
 )

dark_brown_chapter0 = dark_brown.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'Barcelone',
  likes: 0,
  country: 'es'
)

dark_brown_chapter1 = dark_brown.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'Geneve',
  likes: 0,
  country: 'ch'
)

dark_brown_chapter1.photos.create!(
 image_url: 'http://i.huffpost.com/gen/1338716/images/o-ARCTIC-TEDDY-BEAR-facebook.jpg',
 title: "Shoes cause it's cold",
 description: 'brrrrrrrr'
)


# *************** OUR DISPLAY TED : *****************

puts "\n"
puts "Creating OUR MAIN brown teddybear with some chapters : "

brown_big_nose = Ted.create!(
 name: 'Izzy',
 user: traveler5,
 rank: Faker::Number.between(1, 5),
 distance_traveled: Faker::Number.between(10, 3000),
 avatar_url: 'http://img2.everafterguide.com/EpA4ddwvwaKmtVlzyp3Lkt1fmzg=/product_images/full/3ffb45f9675205d7c7fb0e5d837d6cf4287485a2/buddy-balls-plush-teddy-bear-convertible-toy-football-dash-tan-brown-white-by-buddy-balls.jpg',
 created_at: DateTime.parse("10/07/2016 17:00")

)


puts "\n"
puts "Chapter 0..."

brown_big_nose_chapter0 = brown_big_nose.chapters.create!(
  user: travelers.sample,
  description: "Sunny all the time + beach every day, what did you expect",
  localisation: 'Florida',
  likes: 0,
  country: 'us'
)

brown_big_nose_chapter0.photos.create!(
 image_url: 'http://www.disneyparksmerchandise.com/wp-content/uploads/2014/04/1025838_670988706249143_184761274_o.jpg',
 title: 'DisneyLand',
 description: 'Hey ! First step of your travel baby !'
)


puts "\n"
puts "Chapter 1..."

brown_big_nose_chapter1 = brown_big_nose.chapters.create!(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'South Africa',
  likes: 0,
  country: 'za'
)

brown_big_nose_chapter1.photos.create!(
 image_url: 'http://www.c-k-images.com/wordpress391/wp-content/uploads/photo-gallery/teddy/teddy-021.jpg',
 title: 'Durban ! The sea was a little cold !',
 description: 'What a quiet moment'
)

brown_big_nose_chapter1.photos.create!(
 image_url: 'https://pbs.twimg.com/media/CkAVlxDVEAALPoY.jpg',
 title: 'Time for flight !',
 description: 'goodbye !!'
)

brown_big_nose_chapter1.photos.create!(
 image_url: 'http://teddy-land.com/resources/115/Teddy-Land-Christian-Kneidinger-3-original.jpg',
 title: 'Capetown is beautiful',
 description: 'Sport time :P'
)


puts "\n"
puts "Chapter 2..."

brown_big_nose_chapter2 = brown_big_nose.chapters.create!(
  user: travelers.sample,
  description: "Hollywood was a lot of fun, so was Dinseyland",
  localisation: 'Hollywood',
  likes: 0,
  country: 'us'
)

brown_big_nose_chapter2.photos.create!(
 image_url: 'https://neverimitate.files.wordpress.com/2014/08/p1020445.jpg',
 title: 'Castles !! ',
 description: 'I was really inspired taking this photo !'
)

brown_big_nose_chapter2.photos.create!(
 image_url: 'http://static.socialitelife.com/uploads/2013/02/11/jennifer-lawarence-teddy-bear-heathrow-02112013-03.jpg',
 title: 'Guess who we saw in Hollywood ?',
 description: 'Good memory :) '
)

brown_big_nose_chapter2.photos.create!(
 image_url: 'https://i.ytimg.com/vi/wrx9K5N3PXY/maxresdefault.jpg',
 title: 'Met other teddybears !!!!',
 description: 'We had a lot of fun !'
)


puts "\n"
puts "Chapter 3..."

brown_big_nose_chapter3 = brown_big_nose.chapters.create!(
  user: travelers.sample,
  description: "Venise has more than 150 canals and 1,250 bridges, but it never seems crowded, nor bent and bitter from fleecing the tourist",
  localisation: 'Italy',
  likes: 0,
  country: 'it'
)

brown_big_nose_chapter3.photos.create!(
 image_url: 'https://pbs.twimg.com/media/C4lloRHVMAEGu32.jpg',
 title: 'zzzzzz....',
 description: 'everybody is tired'
)

brown_big_nose_chapter3.photos.create!(
 image_url: 'http://4.bp.blogspot.com/-PyV4XXC-jUY/U1GfG53k6HI/AAAAAAAAAxM/625i6iYpsME/s1600/638.jpg',
 title: 'Italia la vida',
 description: 'beautiful landscape !!! '
)

