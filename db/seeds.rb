require 'faker'

user = User.create(
  email:"polo@hello.com" ,
  password:"password" ,
  password_confirmation: "password"
)

10.times do
  Ted.create(name: Faker::Name.first_name, user_id: user.id)

end
